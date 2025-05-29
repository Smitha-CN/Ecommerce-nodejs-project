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
variable "subnet_id" {
  type    = string
  default = "subnet-04c5dc8021ed0906d" # Replace with your actual default Subnet ID
}


variable "key_name" {
  type = string
  default = "deee"
}

variable "ec2_ami" {
  default = "ami-049ae37f76c31ab26" # Amazon Linux 2 AMI (for example)
}
