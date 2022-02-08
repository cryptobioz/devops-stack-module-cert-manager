module "cert-manager" {
  source = "../self-signed/"

  cluster_name     = var.cluster_name
  base_domain      = var.base_domain
  argocd_namespace = var.argocd_namespace

  namespace      = var.namespace

  extra_yaml = concat([templatefile("${path.module}/values.tmpl.yaml", {
    router_pool_id = var.router_pool_id
  })], var.extra_yaml)
}
