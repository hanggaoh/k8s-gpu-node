provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "gpu_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "K8s-GPU-Node"
  }

  # Embed the bundled bootstrap script (vendor'd scripts) into instance user_data
  user_data = file("${path.module}/../scripts/bootstrap.sh")
}

output "instance_id" {
  value = aws_instance.gpu_instance.id
}

output "instance_public_ip" {
  value = aws_instance.gpu_instance.public_ip
}