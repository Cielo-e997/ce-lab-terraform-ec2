variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "ec2-lab"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "VPC ID to deploy into"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for web servers"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for app servers"
  type        = list(string)
}

variable "my_ip" {
  description = "Your IP address for SSH access (e.g. 203.0.113.10/32)"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name for SSH"
  type        = string
}

variable "web_instance_count" {
  description = "Number of web server instances"
  type        = number
  default     = 2
}

variable "app_instance_count" {
  description = "Number of app server instances"
  type        = number
  default     = 2
}
