variable "aws_region" { type = string }
variable "project" { type = string }
variable "app" { type = string }
variable "env" { type = string }
variable "vpc_cidr" { type = string }

variable "subnets" {
  description = "A map of subnet configurations."
  type = map(object({
    subnet_name = string
    cidr_block  = string
    az_suffix   = string
  }))
}
