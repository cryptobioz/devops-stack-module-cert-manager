#######################
## Standard variables
#######################

variable "cluster_name" {
  type = string
}

variable "base_domain" {
  description = "Principal default domain"
  type        = string
}


variable "argocd_namespace" {
  type = string
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

variable "app_skip_crds" {
  type = bool
  default = false
}

variable "app_autosync" {
  type = bool
  default = false
}

variable "helm_values" {
  description = "Helm values, passed as a list of HCL structures."
  type        = any
  default     = []
}

variable "dependency_ids" {
  type = map(string)

  default = {}
}

#######################
## Module variables
#######################
