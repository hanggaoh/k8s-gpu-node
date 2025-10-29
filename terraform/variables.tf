variable "region" {
  description = "The AWS region to deploy the Kubernetes node with GPU support."
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of EC2 instance to use for the Kubernetes node."
  type        = string
  default     = "p3.2xlarge"
}

variable "ami_id" {
  description = "The AMI ID to use for the Kubernetes node."
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to the instance."
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of instances in the node group."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum number of instances in the node group."
  type        = number
  default     = 3
}

variable "min_size" {
  description = "The minimum number of instances in the node group."
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "The VPC ID where the Kubernetes node will be deployed."
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the Kubernetes node will be deployed."
  type        = list(string)
}