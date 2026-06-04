resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair_name

  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_instance_profile

  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y awscli
              EOF

  tags = {
    Name = var.instance_name
  }
}