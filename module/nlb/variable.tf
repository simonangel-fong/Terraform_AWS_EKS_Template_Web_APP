# ##############################
# App
# ##############################
variable "aws_region" { type = string }
variable "project" { type = string }
variable "app" { type = string }
variable "env" { type = string }

# ##############################
# AWS NLB
# ##############################
locals {
  nlb_name = "${var.project}-${var.app}-${var.env}-nlb"
  tg_name = "${var.project}-${var.app}-${var.env}-tg"
}

# network
variable "vpc_id" { type = string }
variable "subnet_id_list" { type = list(string) }