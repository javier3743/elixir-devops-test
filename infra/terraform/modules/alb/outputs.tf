output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.lb_dns_name
}