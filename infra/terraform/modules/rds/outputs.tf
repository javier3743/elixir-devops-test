output "db_endpoint" {
  description = "The connection endpoint for the RDS database"
  value       = module.db.db_instance_endpoint
}