data "helm_template" "this" {
  name       = "cert-manager"
  namespace  = "default"
  repository = "https://charts.jetstack.io"

  chart   = "cert-manager"
  version = var.chart_version

  include_crds = "true"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

locals {
  crds = merge([
    for key, value in data.helm_template.this.manifests : merge([
      for crd_value in split("\n---", value) : {
        yamldecode(crd_value).metadata.name = yamldecode(crd_value)
      }
      if length(regexall("kind: CustomResourceDefinition", value)) > 0
    ]...)
  ]...)
}

resource "kubernetes_manifest" "crds" {
  for_each = local.crds
  manifest = merge(
    { for k, v in each.value : k => v if k != "status"},
    { "metadata" = { for k, v in each.value.metadata : k => v if k != "creationTimestamp" } },
    { "metadata" = { for k, v in each.value.metadata : k => v if k != "finalizers" } }
  )
}
