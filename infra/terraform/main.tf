provider "aws" {
  region = var.region
}

module "iam" {
  source = "./modules/iam"

  cluster_roles_policies = var.cluster_roles_policies
  nodes_roles_policies   = var.nodes_roles_policies
}

module "vpc" {
  source = "./modules/vpc"

  region               = var.region
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnet_ids
  cluster_role_arn   = module.iam.cluster_role_arn
  nodes_role_arn     = module.iam.nodes_role_arn
}

module "k8s_resources" {
  source = "./modules/k8s-resources"

  eks_cluster_endpoint       = module.eks.cluster_endpoint
  eks_cluster_ca_certificate = module.eks.cluster_certificate_authority_data
  eks_cluster_name           = module.eks.cluster_name
}