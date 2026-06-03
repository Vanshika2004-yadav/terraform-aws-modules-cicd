variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH"
  type        = string
}