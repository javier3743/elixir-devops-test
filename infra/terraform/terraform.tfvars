region = "us-west-2"
# VPC
vpc_cidr = "10.0.0.0/16"
availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
database_subnet_cidrs = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]

# EKS
cluster_name = "kelia-cluster"
cluster_version = "1.30"
instance_types = ["t2.micro"]

# IAM
cluster_roles_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
  "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
]
nodes_roles_policies = [
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
]

# RDS
db_instance_class = "db.t3.micro"

backend_bucket = "elixir-devops-test-terraform-state"
backend_key_table = "elixir-devops-test-terraform-state"

db_username = "kelia1"
db_password = "kelia1"
db_name = "kelia"
