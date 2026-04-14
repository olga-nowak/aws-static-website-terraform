# AWS Static Website with Terraform

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

---

## Project Structure

```
cloud/
├── docs
├── README.md
├── terraform
│   ├── cloudfront.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── s3.tf
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
│   ├── terraform.tfvars
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

---

## Deployment

### 1. Initialize Terraform

```
terraform init
```

### 2. Preview infrastructure

```
terraform plan
```

### 3. Deploy

```
terraform apply
```

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
