output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "db_endpoint" {
  description = "The connection endpoint for the RDS database"
  value       = module.rds.db_endpoint
}