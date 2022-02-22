module "cert-manager" {
  source = "../self-signed/"

  cluster_name     = var.cluster_name
  base_domain      = var.base_domain
  argocd_namespace = var.argocd_namespace

  namespace = var.namespace

  helm_values_overrides = concat(local.helm_values_overrides, var.helm_values_overrides)
}
