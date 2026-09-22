module "vpc" {
  source = "./modules/vpc"

  name                 = var.project_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
module "eks" {
  source = "./modules/eks"

  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  vpc_id                               = module.vpc.vpc_id
  private_subnet_ids                   = module.vpc.private_subnet_ids
  node_instance_types                  = ["t3.small"]
  desired_nodes                        = 2
  min_nodes                            = 1
  max_nodes                            = 2
  cluster_admin_principal_arn          = "arn:aws:iam::275839157288:user/devops-intern"
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
}
