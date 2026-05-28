# Terraform AWS Modules CI/CD Project

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform with AWS Cloud services.
The infrastructure is designed using a modular Terraform architecture where each AWS service is created as a separate reusable module.

The project also integrates GitHub Actions CI/CD pipeline to automate Terraform validation and planning whenever code is pushed to GitHub.

---

# AWS Services Used

The following AWS services are used in this project:

1. Amazon EC2 Instance
2. Amazon S3 Bucket
3. AWS Security Group

---

# Modules Used

## EC2 Module

The EC2 module is used to create an AWS EC2 instance.

Path:

```text
modules/ec2
```

Files included:

* main.tf
* variables.tf
* outputs.tf

---

## S3 Module

The S3 module is used to create an AWS S3 bucket.

Path:

```text
modules/s3
```

Files included:

* main.tf
* variables.tf
* outputs.tf

---

## Security Group Module

The Security Group module is used to allow inbound and outbound traffic rules for the EC2 instance.

Path:

```text
modules/security_group
```

Files included:

* main.tf
* variables.tf
* outputs.tf

---

# Folder Structure

```text
terraform-aws-modules-cicd/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── security_group/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── README.md
└── .gitignore
```

---

# GitHub Actions CI/CD

This project uses GitHub Actions for CI/CD automation.

The workflow automatically runs whenever code is pushed to the main branch.

The workflow performs the following tasks:

1. Checkout Repository Code
2. Setup Terraform
3. Configure AWS Credentials
4. Terraform Init
5. Terraform Format Check
6. Terraform Validate
7. Terraform Plan

Workflow file:

```text
.github/workflows/terraform.yml
```

---

# GitHub Secrets Used

AWS credentials are securely stored in GitHub Secrets.

Required secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

---

# Terraform Commands

## Initialize Terraform

```bash
terraform init
```

## Check Terraform Formatting

```bash
terraform fmt
```

## Validate Terraform Configuration

```bash
terraform validate
```

## Preview Infrastructure Changes

```bash
terraform plan
```

## Create Infrastructure

```bash
terraform apply
```

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Resources Created

After successful execution, the following AWS resources are created:

* EC2 Instance
* S3 Bucket
* Security Group

---

# Outputs

The project displays the following outputs:

```text
ec2_public_ip
s3_bucket_name
security_group_id
```

---

# Conclusion

This project demonstrates how Terraform modules can be used to create reusable and scalable AWS infrastructure.

It also demonstrates CI/CD automation using GitHub Actions for validating and planning Terraform infrastructure automatically after every code push.
