locals {
  helm_values = [{
    cert-manager = {
      azureIdentity = {
        resourceID = azurerm_user_assigned_identity.cert_manager.id
        clientID   = azurerm_user_assigned_identity.cert_manager.client_id
      }

      clusterIssuers = {
        letsencrypt = {
          enabled = true
        }
        acme = {
          solvers = [
            {
              dns01 = {
                azureDNS = {
                  subscriptionID    = split("/", data.azurerm_subscription.primary.id)[2]
                  resourceGroupName = data.azurerm_resource_group.this.name
                  hostedZoneName    = var.base_domain
                  # Azure Cloud Environment, default to AzurePublicCloud
                  environment = "AzurePublicCloud"
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
      replicaCount = 2
      podLabels = {
        aadpodidbinding = "cert-manager"
      }
      resources = {
        limits = {
          memory = "64Mi"
        }
        requests = {
          cpu    = "10m"
          memory = "16Mi"
        }
      }

      webhook = {
        replicaCount = 2
        resources = {
          limits = {
            memory = "24Mi"
          }
          requests = {
            cpu    = "10m"
            memory = "16Mi"
          }
        }
      }

      cainjector = {
        replicaCount = 2
        resources = {
          limits = {
            memory = "128Mi"
          }
          requests = {
            cpu    = "10m"
            memory = "32Mi"
          }
        }
      }
    }
  }]
}
