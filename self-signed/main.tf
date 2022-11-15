resource "tls_private_key" "root" {
  algorithm = "ECDSA"
}

resource "tls_self_signed_cert" "root" {
  private_key_pem = tls_private_key.root.private_key_pem

  subject {
    common_name  = "devops-stack.camptocamp.com"
    organization = "Camptocamp, SA"
  }

  validity_period_hours = 8760

  allowed_uses = [
    "cert_signing",
  ]

  is_ca_certificate = true
}


module "cert-manager" {
  source = "../"

  cluster_name     = var.cluster_name
  base_domain      = var.base_domain
  argocd_namespace = var.argocd_namespace

  namespace = var.namespace

  app_autosync = var.app_autosync

  helm_values = concat([{
    cert-manager = {
      tlsCrt = base64encode(tls_self_signed_cert.root.cert_pem)
      tlsKey = base64encode(tls_private_key.root.private_key_pem)
    }
  }], var.helm_values)

  dependency_ids = var.dependency_ids
}
