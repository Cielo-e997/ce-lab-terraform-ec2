terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  count = var.web_instance_count

  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"

  subnet_id = var.public_subnet_ids[count.index % length(var.public_subnet_ids)]

  vpc_security_group_ids = [aws_security_group.web.id]

  key_name = var.key_name

  user_data = file("${path.module}/user-data.sh")

  tags = {
    Name        = "${var.project_name}-web-${count.index + 1}"
    Environment = var.environment
    Role        = "web"
  }
}

resource "aws_instance" "app" {
  count = var.app_instance_count

  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"

  subnet_id = var.private_subnet_ids[count.index % length(var.private_subnet_ids)]

  vpc_security_group_ids = [aws_security_group.app.id]

  key_name = var.key_name

  tags = {
    Name        = "${var.project_name}-app-${count.index + 1}"
    Environment = var.environment
    Role        = "app"
  }
}
