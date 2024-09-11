output "cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
  description = "Cluster role arn"
}

output "nodes_role_arn" {
  value = aws_iam_role.eks_node_role.arn
  description = "Nodes role arn"
}