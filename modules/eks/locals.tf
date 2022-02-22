locals {
  assumable_role_arn = var.base_domain == null ? "" : module.iam_assumable_role_cert_manager.0.iam_role_arn

  helm_values_overrides = [{
    cert-manager = {
      serviceAccount = {
        annotations = {
          "eks.amazonaws.com/role-arn" = local.assumable_role_arn
        }
      }
      clusterIssuers = {
        letsencrypt = {
          enabled = true
        }
        acme = {
          solvers = [
            {
              dns01 = {
                route53 = {
                  region = data.aws_region.current.name
                }
              }
              selector = {
                dnsZones = [var.base_domain]
              }
            },
            {
              http01 = {
                ingress = {}
              }
            },
          ]
        }
      }
    }
  }]
}
