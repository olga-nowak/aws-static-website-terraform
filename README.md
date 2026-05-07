# AWS Static Website with Terraform

![Terraform Check](https://github.com/olga-nowak/aws-static-website-terraform/actions/workflows/terraform-check.yml/badge.svg)

## Overview

This project implements a **serverless static website architecture** on AWS using **Terraform**.
The goal is to provide a **globally accessible, low-latency, and highly available website** while ensuring full reproducibility through Infrastructure as Code (IaC).

---

## Architecture

The system follows a simple and efficient serverless design:

**User → CloudFront → S3 (Private Bucket)**

* **Amazon S3** stores static website files (HTML, CSS, images)
* **Amazon CloudFront** delivers content globally via a Content Delivery Network (CDN)
* **Origin Access Control (OAC)** ensures secure access from CloudFront to S3
* The S3 bucket is **not publicly accessible**

---

## Technologies Used

* **AWS S3** – static storage
* **AWS CloudFront** – CDN and HTTPS delivery
* **AWS IAM** – access management
* **Terraform** – infrastructure provisioning
* **AWS CLI** – configuration and deployment

---

## Features

* Serverless architecture (no EC2 required)
* Global content delivery with low latency
* Private and secure S3 storage
* Fully reproducible infrastructure
* Automated website deployment via Terraform
* Custom error handling (403/404 → `error.html`)
* Automated Terraform validation with GitHub Actions

---

## Project Structure

```
aws-static-website-terraform/
├── .github
│   └── workflows
│       └── terraform-check.yml
├── .gitignore
├── README.md
├── scripts
│   ├── deploy.sh
│   └── destroy.sh
├── terraform
│   ├── cloudfront.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── s3.tf
│   ├── .terraform.lock.hcl
│   ├── terraform.tfvars.example
│   ├── variables.tf
│   ├── versions.tf
│   └── website_files.tf
└── website
    ├── cooking.png
    ├── error.css
    ├── error.html
    ├── family.webp
    ├── happy_cat.png
    ├── index.css
    ├── index.html
    ├── sport.avif
    └── study.webp
    
```

---

## Deployment

### 1. Clone Repository

```
git clone <repository-url>
cd aws-static-website-terraform/terraform
```

### 2. Initialize Terraform

```
terraform init
```

### 3. Validation and Testing

Before deployment, validate the Terraform configuration:

```
terraform fmt -check -recursive
terraform validate
terraform plan
```

Once prompted, enter the AWS region and a globally unique bucket name according to the examples in `terraform.tfvars.example`.

### 4. Deploy

```
terraform apply
```

If prompted, enter the AWS region and bucket name again.

Alternatively, deployment and cleanup can be performed using the scripts in the `scripts/` directory.

---

## Accessing the Website

After deployment, Terraform outputs a CloudFront domain:

```
https://<cloudfront-domain>
```

---

## Cleanup

To remove all AWS resources:

```
terraform destroy
```
If prompted, enter region and bucket name again.

If the S3 bucket is not empty:

```
aws s3 rm s3://<bucket-name> --recursive
terraform destroy
```

---

## Key Learning Points

* Serverless architectures simplify scalability and reduce operational overhead
* Infrastructure as Code enables consistent and reproducible deployments
* CloudFront caching and S3 access control require careful configuration
* Debugging cloud systems requires a structured, step-by-step approach

---

## Author

Olga Nowak
