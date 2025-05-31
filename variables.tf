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
  default = "subnet-031917a2450079b73" 
}
variable "db_subnet_ids" {
  type = list(string)
  default = [
    "subnet-031917a2450079b73", # in ca-central-1a
    "subnet-0abc1234def567890"  # another subnet in ca-central-1b
  ]
}

variable "key_name" {
  type = string
  default = "deee"
}

variable "ec2_ami" {
  default = "ami-049ae37f76c31ab26" 
}
variable "db_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "admin" # You can change this
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
  default     = "StrongPassword!" 
}

