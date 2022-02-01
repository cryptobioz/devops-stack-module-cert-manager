#######################
## Standard variables
#######################

variable "cluster_info" {
  type = object({
    cluster_name     = string
    base_domain      = string
    argocd_namespace = string
  })
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

variable "extra_yaml" {
  type    = list(string)
  default = []
}

#######################
## Module variables
#######################
