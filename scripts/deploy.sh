#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../terraform"

terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
terraform apply