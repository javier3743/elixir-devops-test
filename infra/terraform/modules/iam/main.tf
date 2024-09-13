module "eks_cluster_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.3"

  create_role = true
  role_name   = "eks-cluster-role"
  role_requires_mfa = false

  trusted_role_services = [
    "eks.amazonaws.com"
  ]

  custom_role_policy_arns = var.cluster_roles_policies
}

module "eks_node_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.3"

  create_role = true
  role_name   = "eks-node-role"
  role_requires_mfa = false

  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  custom_role_policy_arns = var.nodes_roles_policies
}