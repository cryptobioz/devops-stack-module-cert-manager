variable "resource_group_name" {
  description = "The Resource Group where the DNS zone should exist."
  type        = string
}

variable "node_resource_group_name" {
  description = "The Resource Group of the Managed Kubernetes Cluster."
  type        = string
}
