# 🏗️ Terraform Infrastructure Projects

This repository contains Terraform configurations for managing AWS infrastructure using custom modules and reusable components.

## 📁 Project Structure

```
.
├── projects/                    # Infrastructure projects
│   └── platform/               # Platform-specific infrastructure
│       └── test/               # Test environment
│           ├── main.tf         # Main Terraform configuration
│           ├── variables.tf    # Variable definitions
│           ├── outputs.tf      # Output definitions
│           ├── backend.tf      # S3 backend configuration
│           └── test.tfvars     # Environment-specific variables
├── .github/
│   └── workflows/              # GitHub Actions workflows
└── README.md
```

## 📦 Terraform Modules

The infrastructure is managed using custom Terraform modules you can find it on this repo https://github.com/Khaled-SRE/terraform-modules.git

## 🔄 Workflow

### 🚀 CI/CD Pipeline (GitHub Actions)
The infrastructure is managed through GitHub Actions workflows with OIDC authentication:

1. **Workflow Trigger** ⚡
   - Manual trigger via workflow_dispatch
   - Inputs required:
     - Tribe (e.g., platform)
     - Environment (test/stg/prod)
     - Action (plan/apply/destroy)

2. **Authentication** 🔐
   - Uses GitHub OIDC for secure AWS authentication
   - Assumes `github-oidc-role-test` role in AWS
   - Role has permissions to assume `terraform-role` for S3 backend access

3. **Execution Steps** ⚙️
   - AWS CLI and kubectl setup
   - Terraform initialization with S3 backend
   - Validation and planning
   - Production environment protection with Conftest
   - Apply changes with auto-approval

### 💻 Local Development
1. **AWS Login** 🔑
   ```bash
   aws configure
   ```

2. **Change Role** 🔄
   - Update the role ARN in `backend.tf` with your specific role or credentials

3. **Initialize Terraform** 🚀
   ```bash
   cd projects/platform/test
   terraform init
   ```

4. **Plan Changes** 📋
   ```bash
   terraform plan -var-file test.tfvars
   ```

5. **Apply Changes** ✅
   ```bash
   terraform apply -var-file test.tfvars
   ```

## 🔧 Backend Configuration

The Terraform state is stored in an S3 bucket with the following configuration:
```hcl
terraform {
  backend "s3" {
    bucket         = "platform-test-remote-tfstate"
    key            = "platform/test/platform-test"
    region         = "eu-west-1"
    encrypt        = true
    use_lockfile   = true
    assume_role = {
      role_arn = "arn:aws:iam::******:role/terraform-role"
    }
  }
}
```

### 👥 IAM Roles and Permissions

1. **terraform-role** 🔑
   - Admin access for Terraform operations
   - Used by S3 backend for state management
   - Can only be assumed by github-oidc-role

2. **github-oidc-role-test** 🔐
   - Used by GitHub Actions workflow
   - Has permissions to assume terraform-role
   - Configured with OIDC trust relationship

## 📝 Required Input Parameters

### 🔑 Environment Variables
- `AWS_REGION`: AWS region for deployment (eu-west-1)
- `AWS_ACCOUNT_ID`: AWS account ID for role ARNs

### 📋 Terraform Variables
- Environment-specific variables in `*.tfvars` files
- Required variables defined in `variables.tf`

