variable "image_id" {
  type        = string
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
  description = "The instance type"
}

variable "private_key_location" {
  type        = string
  description = "Location of your private key to SSH into the instance"
}