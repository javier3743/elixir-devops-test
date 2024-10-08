output "vpc_id" {
  description = "ID of the VPC"
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value = module.vpc.private_subnets
}

output "database_subnet_group_name" {
  description = "Name of the database subnet group"
  value = module.vpc.database_subnet_group_name
}

output "rds_security_group_id" {
  description = "ID of RDS security group"
  value       = module.rds_security_group.security_group_id
}

output "eks_node_sg_id" {
  description = "ID of EKS node security group"
  value       = module.eks_node_sg.security_group_id
}

output "alb_sg_id" {
  description = "ID of ALB security group"
  value       = module.alb_sg.security_group_id
}