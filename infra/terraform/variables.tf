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

variable "cluster_name" {
  description = "Cluster name"
  type = string
}

variable "cluster_version" {
  description = "Cluster version"
  type = string
}

variable "cluster_roles_policies" {
  description = "Cluster roles"
  type = list(string)
}

variable "nodes_roles_policies" {
  description = "Nodes roles"
  type = list(string)
}