provider "aws" {
  region = var.aws_region
}

# S3 bucket for frontend
resource "aws_s3_bucket" "frontend_bucket" {
  bucket = var.frontend_bucket_name

force_destroy = true
  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  
}



# IAM Role for EC2
resource "aws_iam_role" "ec2_role" {
  name = "ecomm-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}



# Backend EC2 Instance
resource "aws_instance" "backend_instance" {
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  
  
  key_name               = var.key_name

  user_data = file("user_data_backend.sh")

  tags = {
    Name = "ecomm-backend"
  }
}
