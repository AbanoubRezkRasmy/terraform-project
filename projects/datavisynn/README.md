# 🚀 EKS Platform Infrastructure

This repository contains Terraform configurations for deploying a secure and scalable EKS platform with integrated security features.

## 🧭 Architecture Overview

The infrastructure includes:

- ☸️ EKS Cluster with managed node groups
- 🎯 ALB Ingress Controller for load balancing
- 🌐 Route53 for DNS management
- 🔒 ACM for SSL/TLS certificates
- 🤖 ArgoCD for GitOps deployments
- 📛 External DNS for automatic DNS management

## 🌐 Domain Management

### Domain Registration and SSL Setup
1. **Domain Registration** 🏷️
   - Domain registered through Hostinger
   - Example: `platform-online.shop`


2. **SSL Certificate** 🔒
   - Certificate obtained using Certbot Let's Encrypt
   - Certificate imported into AWS Certificate Manager (ACM)
   - Used for securing HTTPS endpoints

3. **DNS Management** 📝
   - Nameservers (NS) updated to AWS Route 53
   - Domain now managed through AWS Route 53
   - Enables AWS DNS management and ACM integration

## 🛠️ Prerequisites

- 🧑‍💻 AWS CLI configured with appropriate credentials
- 🌍 Terraform >= 1.10
- 🐳 kubectl
- 🎩 helm
- 🔐 AWS IAM role with necessary permissions
- 📦 S3 bucket for Terraform state

## 🔐 Required AWS Permissions

The IAM role should have permissions for:

- ☸️ EKS cluster management
- 🌐 VPC and networking
- 🪪 IAM role and policy management
- 📛 Route53
- 🔒 ACM
- 📦 S3
- 📊 CloudWatch

## 🏗️ Infrastructure Components

### 🌐 Network Layer
- 🕸️ VPC with public and private subnets
- 🔐 Security groups for ALB and EKS
- 🌉 NAT Gateways for private subnet internet access

### ☸️ EKS Cluster
- 👥 Managed node groups
- 🎯 ALB Ingress Controller
- 🤖 ArgoCD for GitOps
- 📛 External DNS

## ⚙️ Configuration

### 🧾 Environment Variables
Create a `test.tfvars` file with your configuration:

```hcl
env    = "test"
region = "eu-west-1"

# VPC Configuration
vpc_cidr             = "10.0.0.0/16"
vpc_name             = "eks-test-vpc"
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# EKS Configuration
cluster_name    = "platform-test-eks"
cluster_version = "1.33"
```

## 🚀 Deployment

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan -var-file=test.tfvars
```

3. Apply the configuration:
```bash
terraform apply -var-file=test.tfvars
```

## 🔐 Security Features

###  Network Security:
- 🕸️ Private subnets for EKS nodes
- 🔐 Security groups with least privilege
- 🌉 NAT Gateways for controlled internet access

## 🛠️ Maintenance

### 📈 Scaling the Cluster
1. Update node group configuration in `test.tfvars`
2. Apply changes:
```bash
terraform apply -var-file=test.tfvars
```

## 🧪 Troubleshooting

### 🐞 Common Issues

#### ALB Creation:
- ✅ Ensure ALB Ingress Controller is properly installed
- 🔐 Check IAM permissions
- 🔧 Verify security group configurations


#### DNS Issues:
- 📛 Verify Route53 configuration
- 🤖 Check External DNS addon
- 🔍 Review DNS records

