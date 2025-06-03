# E-Commerce WebApp DevOps Implementation on AWS

## 📌 Project Objective

Automate the deployment of a scalable, secure, and observable e-commerce web application using AWS services and DevOps best practices.

---

## 🏗️ Architecture Overview

This project integrates several AWS services to build a robust, production-ready deployment:

- **Frontend**: React.js hosted on **Amazon S3** (Static Website Hosting)
- **Backend**: Node.js with Express running on **Amazon EC2**
- **Database**: **Amazon RDS** (MySQL)
- **Monitoring**: **Amazon CloudWatch** for logging and CPU monitoring
- **CI/CD**: **AWS CodePipeline** and **CodeBuild** integrated with **GitHub**
- **DNS & CDN**: **Amazon Route 53** pointing to S3 static website
- **Infrastructure as Code**: **Terraform**

---

## ⚙️ Tech Stack

| Layer        | Technology            |
|--------------|------------------------|
| Frontend     | React.js               |
| Backend      | Node.js + Express      |
| Database     | Amazon RDS (MySQL)     |
| Hosting      | Amazon S3, EC2         |
| DevOps Tools | GitHub, CodePipeline, CodeBuild |
| Monitoring   | Amazon CloudWatch      |
| DNS          | Amazon Route 53        |
| IaC          | Terraform              |

---

## 🚀 Deployment Workflow

### Step 1: Infrastructure Provisioning (Terraform)

- Created S3 buckets and bucket policies
- Defined AWS providers and regions
- Created IAM roles, EC2 instances, and security groups
- Created RDS and connected it using SQLectron (for table/data setup)
- Created CloudWatch Alarms (CPU Utilization)
- Configured Route 53 Hosted Zones

### Step 2: CI/CD Pipeline

- Initialized GitHub repository and committed Terraform & app code
- Configured 3 CodePipelines:
  - **Infrastructure Deployment**
  - **Frontend Deployment**
  - **Backend Deployment**
- Created separate `buildspec.yml` files for:
  - Infrastructure
  - Frontend
  - Backend

### Step 3: Monitoring & Alerts

- Enabled CloudWatch metrics and logs for EC2 and RDS
- Setup CloudWatch Alarms for CPU Utilization

### Step 4: Testing & Validation

- Verified frontend via S3 static website URL
- Verified backend API through `/api/ProductList.js`
- Ensured database connectivity via `.env` setup for RDS
- Verified Route 53 alias record pointing to S3 website

---

## 📡 Domain & Routing

- Configured **Route 53** with A records aliasing to the S3 static website URL
- Health checks and failover (if applicable) can be configured via Route 53

---

## 📈 Monitoring

- CloudWatch enabled for:
  - EC2 CPU Utilization
  - RDS logs
  - Application logs (if configured)

---

## 🧪 Validation

- Frontend accessible via S3 static website link
- Backend reachable via public EC2 IP or domain routing
- Database connected and tested using API endpoints

---

## ✅ Conclusion

- Full AWS-powered DevOps lifecycle implemented
- CodePipeline-based CI/CD from GitHub to AWS
- Infrastructure managed via Terraform
- Centralized monitoring and logging through CloudWatch
- Scalable, secure, and easily deployable e-commerce web app architecture

---

## 📁 Repository Structure

