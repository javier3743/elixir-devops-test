variable "cluster_name" {
  description = "EKS cluster name"
  type = string
}
variable "cluster_version" {
  description = "EKS cluster version"
  type = string
}
variable "vpc_id" {
  description = "VPC ID"
  type = string
}
variable "subnet_ids" {
  description = "Subnet IDs"
  type = list(string)
}
variable "cluster_role_arn" {
  description = "Cluster role arn"
  type = string
}
variable "nodes_role_arn" {
  description = "Nodes role arn"
  type = string
}