module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.11.0"

  name = "${var.cluster_name}-alb"

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids
  security_groups = [var.alb_sg_id]

  target_groups = [
    {
      name_prefix      = "eks-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
    }
  ]

  listeners = [
    {
      port     = 80
      protocol = "HTTP"
      default_action = {
        type               = "forward"
        target_group_index = 0
      }
    }
  ]

}