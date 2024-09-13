output "cluster_role_arn" {
  value       = module.eks_cluster_role.iam_role_arn
  description = "Cluster role ARN"
}

output "nodes_role_arn" {
  value       = module.eks_node_role.iam_role_arn
  description = "Nodes role ARN"
}