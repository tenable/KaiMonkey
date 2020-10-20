variable "environment" {
  description = "the type of environment (dev,staging/prod)"
}

variable "default_tags" {
  default     = {}
  description = "default tags to resources"
}

variable "region" {}
variable "elb_target_group_arn" {}
variable "private_subnet" {}
variable "public_subnet" {}
variable "elb_sg" {}
variable "elb_url" {}
