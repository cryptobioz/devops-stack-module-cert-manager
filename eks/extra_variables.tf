variable "cluster_oidc_issuer_url" {
  type = string
}

variable "other_domains" {
  description = "Other domains used for Ingresses requiring a DNS-01 challenge for Let's Encrypt validation with cert-manager (e.g. wildcard certificates)."
  type        = list(string)
  default     = []
}
