# ##############################
# App
# ##############################
variable "aws_region" { type = string }
variable "project" { type = string }
variable "env" { type = string }

# ##############################
# VPC
# ##############################
locals {
  vpc_name = "${var.project}-${var.env}-vpc"
}

variable "vpc_cidr" { type = string }
variable "vpc_subnet" {
  description = "A map of subnet configurations."
  type = map(object({
    subnet_name = string
    cidr_block  = string
    az_suffix   = string
  }))
}
