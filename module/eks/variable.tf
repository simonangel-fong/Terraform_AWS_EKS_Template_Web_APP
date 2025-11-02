# ##############################
# App
# ##############################
variable "aws_region" { type = string }
variable "project" { type = string }
variable "app" { type = string }
variable "env" { type = string }

# ##############################
# EKS
# ##############################
locals {
  eks_name = "${var.project}-${var.app}-eks"
}
# network
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
# node
variable "node_image" { type = string }
variable "node_type" { type = string }
variable "node_min_size" { type = number }
variable "node_max_size" { type = number }
variable "node_desired_size" { type = number }
