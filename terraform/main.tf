provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "gpu_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "K8s-GPU-Node"
  }

  user_data = <<-EOF
              #!/bin/bash
              # Install NVIDIA drivers and configure container runtime
              bash /path/to/scripts/install-nvidia-drivers.sh
              bash /path/to/scripts/configure-containerd.sh
              bash /path/to/scripts/configure-crio.sh
              bash /path/to/scripts/kubelet-config.sh
              EOF
}

output "instance_id" {
  value = aws_instance.gpu_instance.id
}

output "instance_public_ip" {
  value = aws_instance.gpu_instance.public_ip
}