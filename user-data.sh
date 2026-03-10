#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<HTML
<html>
<head><title>Web Server</title></head>
<body>
  <h1>Hello from EC2!</h1>
  <p>Instance ID: $INSTANCE_ID</p>
  <p>Availability Zone: $AZ</p>
</body>
</html>
HTML