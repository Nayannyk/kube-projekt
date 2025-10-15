locals {
  cluster_name = var.cluster_name
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.3.2"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version
  subnets         = null # let module create VPC & subnets by default
  vpc_id          = null

  node_groups = {
    "${var.node_group_name}" = {
      desired_capacity = var.desired_capacity
      min_capacity     = var.min_size
      max_capacity     = var.max_size

      instance_types = [var.node_instance_type]
      key_name       = var.ssh_key_name

      # passing userdata script content
      user_data = file("${path.module}/eks_userdata.sh")

      asg_desired_capacity = var.desired_capacity

      additional_tags = merge(var.tags, { "kubernetes.io/cluster/${local.cluster_name}" = "owned" })
    }
  }

  manage_aws_auth = true

  tags = var.tags
}

# Configure kubernetes provider using the cluster kubeconfig output from module
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = module.eks.cluster_auth_token # module provides token support
  load_config_file       = false
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = module.eks.cluster_auth_token
    load_config_file       = false
  }
}

# Simple null_resource to demonstrate when cluster is ready (useful for CI ordering)
resource "null_resource" "wait_for_cluster" {
  depends_on = [module.eks]

  provisioner "local-exec" {
    command = "kubectl get nodes --kubeconfig=${path.module}/kubeconfig || true"
    environment = {
      KUBECONFIG = ""
    }
  }
}

