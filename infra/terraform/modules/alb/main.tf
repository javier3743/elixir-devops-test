module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.5.0"

  name = "${var.cluster_name}-alb"

  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnet_ids
  security_groups = [var.alb_sg_id]

  target_groups = [
    {
      name_prefix      = "eks-"
      backend_protocol = "HTTP"
      backend_port     = 4000
      target_type      = "ip"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/healthz"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    }
  ]
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    },
    {
      port               = 4000
      protocol           = "HTTP"
      target_group_index = 1
    }
  ]

  tags = {
    Name = "${var.cluster_name}-alb"
  }
}