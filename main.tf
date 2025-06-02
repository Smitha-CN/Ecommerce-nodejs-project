provider "aws" {
  region = var.aws_region
}

# S3 bucket for frontend
resource "aws_s3_bucket" "frontend_bucket" {
  bucket = var.frontend_bucket_name

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  force_destroy = true
}



# CloudFront distribution for frontend




# IAM Role for EC2






# Backend EC2 Instance
resource "aws_instance" "backend_instance1" {
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  
  
  key_name               = var.key_name

  user_data = file("user_data_backend.sh")

  tags = {
    Name = "ecomm-backend1"
  }
}
