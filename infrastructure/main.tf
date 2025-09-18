module "vpc" {
  source  = "./module/vpc"
  project = var.project
  app     = var.app
  env     = var.env

  aws_region = var.aws_region
  vpc_cidr   = var.vpc_cidr
  subnets    = var.subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id_list" {
  value = module.vpc.subnet_id_list
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.project}-${var.app}"
  kubernetes_version = "1.33"

  # Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # network
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.subnet_id_list
  control_plane_subnet_ids = module.vpc.subnet_id_list
  endpoint_public_access   = true

  # node 
  eks_managed_node_groups = {
    example = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 1
      desired_size   = 1
    }
  }
}
