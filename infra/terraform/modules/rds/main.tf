module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.9.0"

  identifier = "keila"

  engine               = "postgres"
  engine_version       = "13.7"
  family               = "postgres13"
  major_engine_version = "13"
  instance_class       = var.db_instance_class

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  multi_az               = false
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "keila-db"
  }
}