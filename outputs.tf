output "web_instance_ids" {
  description = "IDs of web server instances"
  value       = aws_instance.web[*].id
}

output "web_public_ips" {
  description = "Public IPs of web servers"
  value       = aws_instance.web[*].public_ip
}

output "app_instance_ids" {
  description = "IDs of app server instances"
  value       = aws_instance.app[*].id
}

output "web_security_group_id" {
  description = "Web security group ID"
  value       = aws_security_group.web.id
}

output "app_security_group_id" {
  description = "App security group ID"
  value       = aws_security_group.app.id
}
