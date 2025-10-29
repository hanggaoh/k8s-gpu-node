#!/bin/bash

# Configure CRI-O to support NVIDIA GPUs

# Install necessary packages
yum install -y cri-o nvidia-container-toolkit

# Configure CRI-O to use the NVIDIA runtime
cat <<EOF > /etc/crio/crio.conf
[crio.runtime]
default_runtime = "nvidia"
[crio.runtime.runtimes]
nvidia = {
  runtime_path = "/usr/bin/nvidia-container-runtime",
  runtime_type = "oci"
}
EOF

# Restart CRI-O service to apply changes
systemctl restart crio

# Verify the configuration
crio-status --version
nvidia-smi