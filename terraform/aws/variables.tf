variable "environment" {
  default = "dev"
  description = "the type of environment (dev,staging/prod)"
}

variable "region" {
  default = "us-east-1"
}

variable "db_username" {
  default = "kai_monkey_user_ob6RGj"
}

variable "db_password" {
  default = "kHJ!4dusp7A#Xf21URhhZ1#"
}

variable "default_tags" {
  default     = {}
  description = "default tags to resources"
}