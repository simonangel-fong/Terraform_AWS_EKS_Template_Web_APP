# ##############################
# App
# ##############################
variable "project" {
  type    = string
  default = "tf-demo-eks-webapp"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "aws_region" { type = string }

# ##############################
# AWS VPC
# ##############################
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_subnet" {
  type = map(object({
    subnet_name = string
    cidr_block  = string
    az_suffix   = string
  }))
  default = {
    public_subnet_1a = {
      subnet_name = "public_subnet"
      cidr_block  = "10.0.1.0/24"
      az_suffix   = "a"
    }
    public_subnet_1b = {
      subnet_name = "public_subnet"
      cidr_block  = "10.0.2.0/24"
      az_suffix   = "b"
    }
  }
}

# ##############################
# AWS EKS
# ##############################
variable "node_image" {
  type    = string
  default = "AL2023_x86_64_STANDARD"
}

variable "node_type" {
  type    = string
  default = "t3.medium"
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 4
}

variable "node_desired_size" {
  type    = number
  default = 2
}
