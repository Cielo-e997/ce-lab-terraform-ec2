# Lab M4.08 - Deploy EC2 with Terraform

## Infrastructure Created

This lab deploys a multi-tier EC2 infrastructure using Terraform.

Resources created:

- 2 web server EC2 instances in public subnets
- 2 application server EC2 instances in private subnets
- Web security group allowing HTTP, HTTPS, and SSH
- App security group allowing port 8080 only from the web security group
- Apache installed automatically using a user data script

## Architecture

Web Tier (Public Subnets)
- 2 EC2 instances running Apache
- Accessible via HTTP
- Security group allows:
  - HTTP (80) from anywhere
  - HTTPS (443) from anywhere
  - SSH (22) from operator IP

App Tier (Private Subnets)
- 2 EC2 instances
- Not publicly accessible
- Security group allows:
  - Port 8080 from web security group
  - SSH from web security group

## Deployment Steps

Initialize Terraform:

```bash
terraform init
```

Format configuration:

```bash
terraform fmt
```

Validate configuration:

```bash
terraform validate
```

Preview changes:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply
```

## Verification

Retrieve public IPs of the web servers:

```bash
terraform output web_public_ips
```

Test the web servers:

```bash
curl http://<WEB_SERVER_IP>
```

Expected output:

```
Hello from EC2!
Instance ID: <instance-id>
Availability Zone: <availability-zone>
```

## Terraform Concepts Used

This lab demonstrates several Terraform concepts:

- Variables
- Security groups as code
- Data sources (AMI lookup)
- EC2 deployment with Terraform
- Multi-instance deployment using `count`
- User data scripts for instance configuration
- Outputs for retrieving infrastructure information

## Security Design

Web Tier:
- Public-facing
- HTTP/HTTPS open to the internet
- SSH restricted to operator IP

App Tier:
- Deployed in private subnets
- Only accessible from the web tier
- No direct internet access

## Files in this Project

- `main.tf` – EC2 instance definitions and provider configuration
- `variables.tf` – input variables
- `outputs.tf` – Terraform outputs
- `security-groups.tf` – security group definitions
- `user-data.sh` – Apache installation and web page setup
- `.gitignore` – prevents sensitive files from being committed

## Notes

Sensitive files such as `terraform.tfvars`, `.pem` keys, and Terraform state files are excluded from version control using `.gitignore`.