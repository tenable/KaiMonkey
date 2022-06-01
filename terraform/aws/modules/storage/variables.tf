variable "environment" {
  description = "the type of environment (dev,staging/prod)"
}

variable "default_tags" {
  default     = {}
  description = "default tags to resource"
}

variable "private_subnet" {}

variable "vpc_id" {}

variable "db_username" {}

variable "db_password" {}
