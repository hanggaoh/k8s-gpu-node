#!/bin/bash

# Configure kubelet to recognize NVIDIA GPUs
KUBELET_CONFIG="/var/lib/kubelet/kubeadm-flags.env"

if [ -f "$KUBELET_CONFIG" ]; then
    echo "Configuring kubelet for NVIDIA GPU support..."
    sed -i 's|--kube-reserved=.*|& --feature-gates=DevicePlugins=true|' "$KUBELET_CONFIG"
    systemctl restart kubelet
    echo "Kubelet configured and restarted."
else
    echo "Kubelet configuration file not found: $KUBELET_CONFIG"
    exit 1
fi