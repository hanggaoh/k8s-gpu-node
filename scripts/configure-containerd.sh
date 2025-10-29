#!/bin/bash

# Configure containerd for NVIDIA GPU support

# Create a configuration file for containerd
cat <<EOF | sudo tee /etc/containerd/config.toml
[plugins]
  [plugins."io.containerd.grpc.v1.cri"]
    [plugins."io.containerd.grpc.v1.cri".containerd]
      snapshotter = "nvidia"
      default_runtime_name = "nvidia"
    [plugins."io.containerd.grpc.v1.cri".cni]
      bin_dir = "/opt/cni/bin"
      conf_dir = "/etc/cni/net.d"
  [plugins."io.containerd.grpc.v1.cri".runtimes]
    [plugins."io.containerd.grpc.v1.cri".runtimes.nvidia]
      runtime_type = "io.containerd.runc.v2"
      runtime_engine = ""
      runtime_root = ""
EOF

# Restart containerd to apply the changes
sudo systemctl restart containerd

echo "Containerd has been configured for NVIDIA GPU support."