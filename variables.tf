variable "image_id" {
  type        = string
  default     = "ami-00c90dbdc12232b58"
  description = "The id of the machine image (AMI) to use for the server."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type"
}

variable "instance_user" {
  type        = string
  default     = "ubuntu"
  description = "The instance user for sshing"
}

variable "security_groups" {
  type        = list(string)
  default     = ["web-server-group"]
}

variable "key_name" {
  type        = string
  default     = "terraform-key"
  description = "The instance key"
}

variable "private_key_location" {
  type        = string
  description = "Location of your private key to SSH into the instance"
}