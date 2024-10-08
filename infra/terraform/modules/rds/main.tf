module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.9.0"

  identifier = "${var.cluster_name}-keila-db"

  engine               = "postgres"
  engine_version       = "15"
  family               = "postgres15"
  major_engine_version = "15"
  instance_class       = var.db_instance_class

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true

  parameters = [
    {
      name  = "rds.force_ssl"
      value = "0"
    }
  ]


  storage_encrypted = false

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "${var.cluster_name}-keila-db"
  }
}