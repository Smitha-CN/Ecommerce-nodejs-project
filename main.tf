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


resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "PublicReadGetObject"
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.frontend_bucket_name}/*"
      }
    ]
  })
}
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

s

data "aws_route53_zone" "primary" {
  name = "smithaproperties.com"
}

resource "aws_route53_record" "frontend_alias" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "www.smithaproperties.com"
  type    = "A"

  alias {
    name                   = "s3-website.ca-central-1.amazonaws.com" 
    zone_id                = "Z1QDHH18159H29"                       
    evaluate_target_health = false
  }
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
# cloudwatch
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when EC2 CPU exceeds 70%"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.backend_instance.id
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}
resource "aws_sns_topic" "alerts" {
  name = "ec2-alerts"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "smithamalthi@gmail.com"  
}


