provider "aws" {
  region = var.region
}

module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
  cluster_roles_policies = var.cluster_roles_policies
  nodes_roles_policies   = var.nodes_roles_policies  
}

module "vpc" {
  source = "./modules/vpc"

  region                = var.region
  cluster_name          = var.cluster_name
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
}

module "rds" {
  source = "./modules/rds"

  vpc_id            = module.vpc.vpc_id
  cluster_name      = var.cluster_name
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
  db_subnet_group_name = module.vpc.database_subnet_group_name
  vpc_security_group_ids  = [module.vpc.rds_security_group_id]
  depends_on = [ module.iam, module.vpc ]
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnet_ids
  instance_types     = var.instance_types
  cluster_role_arn   = module.iam.cluster_role_arn
  nodes_role_arn     = module.iam.nodes_role_arn
  eks_node_sg_id     = module.vpc.eks_node_sg_id

  depends_on = [ module.iam, module.vpc, module.rds ]
}

module "alb" {
  source = "./modules/alb"

  cluster_name      = var.cluster_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.vpc.alb_sg_id

  depends_on = [module.eks]
}
