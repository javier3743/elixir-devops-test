output "vpc_id" {
  description = "ID of the VPC"
  value = module.vpc.vpc_id
}

output "eks_cluster_endpoint" {
  description = "The connection endpoint for the EKS cluster"
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value = module.eks.cluster_name
}

output "db_endpoint" {
  description = "The connection endpoint for the RDS database"
  value       = module.rds.db_endpoint
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.dns_name
}