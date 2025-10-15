#!/bin/bash
# Simple userdata for managed nodegroup instances.
# This runs on node boot. Modify as needed.

set -eux

# Example: install jq and other tools
yum update -y || true
if command -v yum >/dev/null 2>&1; then
  yum install -y jq
elif command -v apt-get >/dev/null 2>&1; then
  apt-get update -y
  apt-get install -y jq
fi

# Enable kubelet additional kubelet args or other customizations here.
# This is an example placeholder.
echo "Node userdata complete" > /var/log/eks_userdata.log

