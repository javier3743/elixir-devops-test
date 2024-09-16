variable "cluster_roles_policies" {
  description = "Cluster roles policies"
  type = list(string)
}

variable "nodes_roles_policies" {
  description = "Nodes roles policies"
  type = list(string)
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}