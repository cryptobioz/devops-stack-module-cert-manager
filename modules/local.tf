locals {
  default_yaml = [templatefile("${path.module}/values.tmpl.yaml", {
    cluster_name = var.cluster_name,
    base_domain  = var.base_domain,
  })]
  all_yaml = concat(local.default_yaml, var.extra_yaml)
}
