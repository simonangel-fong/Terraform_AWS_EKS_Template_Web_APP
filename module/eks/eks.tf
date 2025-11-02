module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = local.eks_name
  kubernetes_version = "1.34"

  # Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
  enable_irsa                              = true

  # network
  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.subnet_ids
  endpoint_public_access   = true

  addons = {
    coredns = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
  }

  # node 
  eks_managed_node_groups = {
    eks_node = {
      ami_type       = "${var.node_image}"  # "AL2023_x86_64_STANDARD"
      instance_types = ["${var.node_type}"] # "t3.medium"
      min_size       = "${var.node_min_size}"
      max_size       = "${var.node_max_size}"
      desired_size   = "${var.node_desired_size}"

      tags = {
        Name = "${var.project}-${var.app}-${var.env}-node"
      }
    }
  }
}
