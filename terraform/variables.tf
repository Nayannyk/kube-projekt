variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "kube-projekt-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.30"
}

variable "node_group_name" {
  description = "Managed node group name"
  type        = string
  default     = "kube-projekt-ng"
}

variable "node_instance_type" {
  description = "EC2 instance type for nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum nodes in node group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum nodes in node group"
  type        = number
  default     = 4
}

variable "ssh_key_name" {
  description = "SSH key name for nodes (key must be present in AWS)"
  type        = string
  default     = "0103.pem"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {
    Project = "kube-projekt"
    Owner   = "devops"
  }
}

