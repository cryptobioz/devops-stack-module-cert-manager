module "cert-manager" {
  source = "../self-signed/"

  cluster_name     = var.cluster_name
  base_domain      = var.base_domain
  argocd_namespace = var.argocd_namespace

  namespace = var.namespace

  helm_values = concat(local.helm_values, var.helm_values)
}
