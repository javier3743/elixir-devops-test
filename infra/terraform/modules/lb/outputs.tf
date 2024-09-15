output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.lb.dns_name
}