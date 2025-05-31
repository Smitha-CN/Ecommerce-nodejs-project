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


# Security Group for Backend
resource "aws_security_group" "backend_sg" {
  name        = "backend-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
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
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  
  key_name               = var.key_name

  user_data = file("user_data_backend.sh")

  tags = {
    Name = "ecomm-backend"
  }
}
# rDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL access"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_sg.id] # backend EC2 SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS security group"
  }
}

resource "aws_db_instance" "ecomm_rds" {
  identifier              = "ecomm-db"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  name                    = "ecommerce"
  username                = var.db_username
  password                = var.db_password
  port                    = 3306
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = true

  tags = {
    Name = "ECommerce RDS DB"
  }
}

