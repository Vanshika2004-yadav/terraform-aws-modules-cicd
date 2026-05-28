  resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile

  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              if command -v apt >/dev/null 2>&1; then
                apt update -y
                apt install apache2 -y
                systemctl start apache2
                systemctl enable apache2
                echo "<h1>Terraform CI/CD Live Deployment Successful</h1>" > /var/www/html/index.html
                echo "<h2>EC2 + S3 + IAM Role Project</h2>" >> /var/www/html/index.html
                echo "<h3>EC2 has S3 Upload Only Permission using IAM Role</h3>" >> /var/www/html/index.html
              elif command -v yum >/dev/null 2>&1; then
                yum update -y
                yum install httpd -y
                systemctl start httpd
                systemctl enable httpd
                echo "<h1>Terraform CI/CD Live Deployment Successful</h1>" > /var/www/html/index.html
                echo "<h2>EC2 + S3 + IAM Role Project</h2>" >> /var/www/html/index.html
                echo "<h3>EC2 has S3 Upload Only Permission using IAM Role</h3>" >> /var/www/html/index.html
              fi
              EOF

  tags = {
    Name = var.instance_name
  }
}