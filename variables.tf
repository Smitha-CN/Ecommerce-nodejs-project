variable "aws_region" {
  default = "ca-central-1"
}

variable "frontend_bucket_name" {
  default = "ecomm-frontend-site-demo"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0bb94a8477d40b0ff"
}


variable "key_name" {
  description = "EC2 Key Pair"
}

variable "ec2_ami" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (for example)
}
