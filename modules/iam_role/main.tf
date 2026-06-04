resource "aws_iam_role" "ec2_s3_upload_role" {
  name = var.role_name

  assume_role_policy = file("${path.module}/trust-policy.json")
}

resource "aws_iam_policy" "s3_upload_only_policy" {
  name        = "${var.role_name}-s3-upload-only-policy"
  description = "Allow EC2 to upload objects only to S3 bucket"

  policy = templatefile("${path.module}/s3-upload-policy.json", {
    bucket_name = var.bucket_name
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_s3_upload_role.name
  policy_arn = aws_iam_policy.s3_upload_only_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.role_name}-instance-profile"
  role = aws_iam_role.ec2_s3_upload_role.name
}