# ##############################
# AWS VPC
# ##############################
module "aws_vpc" {
  source     = "../../module/vpc"
  project    = var.project
  app        = var.app
  env        = var.env
  aws_region = var.aws_region
  # network
  vpc_cidr   = var.vpc_cidr
  vpc_subnet = var.vpc_subnet
}

# ##############################
# AWS EKS
# ##############################
module "aws_eks" {
  source     = "../../module/eks"
  project    = var.project
  app        = var.app
  env        = var.env
  aws_region = var.aws_region
  # vpc
  vpc_id     = module.aws_vpc.vpc_id
  subnet_ids = module.aws_vpc.subnet_id_list
  # node
  node_image        = var.node_image
  node_type         = var.node_type
  node_min_size     = var.node_min_size
  node_max_size     = var.node_max_size
  node_desired_size = var.node_desired_size
}
