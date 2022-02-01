module "cert-manager" {
  source = "../self-signed/"

  cluster_info = var.cluster_info

  namespace      = var.namespace

  extra_yaml = concat([templatefile("${path.module}/values.tmpl.yaml", {
    router_pool_id = var.router_pool_id
  })], var.extra_yaml)
}
