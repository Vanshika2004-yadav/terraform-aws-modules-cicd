module "s3" {
  source      = "./modules/s3"
  bucket_name = "${var.project_name}-bucket-${var.bucket_suffix}"
}

module "security_group" {
  source           = "./modules/security_group"
  sg_name          = "${var.project_name}-sg"
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "iam_role" {
  source      = "./modules/iam_role"
  role_name   = "${var.project_name}-ec2-s3-upload-role"
  bucket_name = module.s3.bucket_name
}

module "ec2" {
  source               = "./modules/ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  security_group_id    = module.security_group.security_group_id
  instance_name        = "${var.project_name}-ec2"
  iam_instance_profile = module.iam_role.instance_profile_name
}