E-Commerce WebApp DevOps on AWS
This project demonstrates an end-to-end DevOps pipeline to deploy a 3-tier e-commerce application using AWS infrastructure, Terraform, React, Node.js, and AWS DevOps services.

🚀 Objective
Automate the deployment of an e-commerce web application with:

Scalability

Security

Observability

Multi-region high availability

🏗️ Architecture Overview
Frontend: React.js hosted on S3 (static website hosting)

Backend: Node.js (Express) hosted on EC2

Database: Amazon RDS (MySQL), optionally with read-replica

DNS: Amazon Route 53

CI/CD: GitHub → AWS CodePipeline → AWS CodeBuild

Monitoring: AWS CloudWatch

IAM: Granular roles for CodePipeline, S3, EC2, and CodeBuild

Security: Security Groups, IAM policies

🛠️ Tech Stack
Layer	Technology
Frontend	React.js
Backend	Node.js (Express)
Database	Amazon RDS (MySQL)
Storage	Amazon S3
DNS	Amazon Route 53
Monitoring	Amazon CloudWatch
DevOps	Terraform, CodePipeline, CodeBuild
Repo	GitHub

📂 Folder Structure
bash
Copy
Edit
project-root/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── frontend/
│   ├── public/
│   ├── src/
│   ├── .env
│   └── buildspec-frontend.yml
├── backend/
│   ├── routes/
│   ├── models/
│   ├── server.js
│   └── buildspec-backend.yml
├── buildspec-infra.yml
└── README.md
⚙️ Deployment Steps
Step 1: Infrastructure with Terraform
Create:

VPCs, Subnets, Route Tables

EC2 instances with IAM roles and security groups

S3 buckets with policies

RDS instance and optionally a read replica

Route53 records

IAM roles for CodePipeline and CodeBuild

Step 2: CI/CD Pipeline Setup
Use GitHub as the source.

Three CodePipelines:

infra-pipeline using buildspec-infra.yml

frontend-pipeline using buildspec-frontend.yml

backend-pipeline using buildspec-backend.yml

Step 3: Monitoring & Security
CloudWatch alarms:

EC2 CPU Utilization

RDS Replica Lag

Enable CloudWatch logs for EC2 and RDS.

Add IAM policies for least-privilege access.

🔍 Testing & Validation
Frontend is accessible at:
http://<S3-static-website-endpoint>

Backend API tested via:

nginx
Copy
Edit
curl http://<EC2-IP>:3000/api/products
Database access tested via SQL client (e.g., SQLectron).

Route 53 provides DNS failover to healthy endpoints.

✅ Conclusion
🏗️ Infrastructure as Code via Terraform

🔁 Automated deployments via AWS CodePipeline

🔐 IAM and security best practices

📈 Monitoring with CloudWatch

🌍 Multi-region design ready
