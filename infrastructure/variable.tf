# ##############################
# App
# ##############################
variable "project" {
  type    = string
  default = "aws-eks-project"
}
variable "app" {
  type    = string
  default = "fastapi"
}
variable "env" {
  type    = string
  default = "dev"
}
variable "aws_region" { type = string }

variable "vpc_ip" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    az_suffix  = string
  }))
  default = {
    public_subnet_1a = {
      cidr_block = "10.0.1.0/24"
      az_suffix  = "a"
    }
    public_subnet_1b = {
      cidr_block = "10.0.2.0/24"
      az_suffix  = "b"
    }
  }
}
