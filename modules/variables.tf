#######################
## Standard variables
#######################

variable "cluster_name" {
  type = string
}

variable "base_domain" {
  type = string
}

variable "oidc" {
  type    = any
  default = {}
}

variable "argocd" {
  type = object({
    namespace  = string
  })
}

variable "cluster_issuer" {
  type    = string
  default = "ca-issuer"
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

variable "profiles" {
  type    = list(string)
  default = ["default"]
}

#######################
## Module variables
#######################
