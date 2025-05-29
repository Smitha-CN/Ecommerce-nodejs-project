variable "aws_region" {
  default = "ca-central-1"
}

variable "frontend_bucket_name" {
  default = "ecomm-frontend-site-demo"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_id" {
  description = "Public subnet ID"
}

variable "key_name" {
  description = "EC2 Key Pair"
}

variable "ec2_ami" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (for example)
}
