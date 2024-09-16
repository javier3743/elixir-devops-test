variable "region" {
  description = "AWS region"
  type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "availability_zones" {
  description = "Availability zones"
  type = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet cidrs"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet cidrs"
  type = list(string)
}

variable "database_subnet_cidrs" {
  description = "CIDR blocks for the database subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "Cluster name"
  type = string
}

variable "cluster_version" {
  description = "Cluster version"
  type = string
}

variable "instance_types" {
  description = "Instance types"
  type = list(string)
}

variable "cluster_roles_policies" {
  description = "Cluster roles"
  type = list(string)
}

variable "nodes_roles_policies" {
  description = "Nodes roles"
  type = list(string)
}

variable "db_name" {
  description = "Database name"
  type = string
}

variable "db_username" {
  description = "Database username"
  type = string
}

variable "db_password" {
  description = "Database password"
  type = string
}

variable "db_instance_class" {
  description = "Database instance class"
  type = string
}

variable "backend_bucket" {
  description = "Backend bucket"
  type = string
}

variable "backend_key_table" {
  description = "Backend key table"
  type = string
}
