resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 awscli -y
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Terraform CI/CD Live Deployment Successful</h1>" > /var/www/html/index.html
              echo "<h2>EC2 deployed using Terraform Modules</h2>" >> /var/www/html/index.html
              echo "<h3>EC2 has IAM Role with S3 Upload Only Permission</h3>" >> /var/www/html/index.html
              EOF

  tags = {
    Name = var.instance_name
  }
}