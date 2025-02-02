locals {
  helm_values = [{
    cert-manager = {
      clusterIssuers = {
        letsencrypt = {
          enabled = true
        }
        acme = {
          solvers = [
            {
              http01 = {
                ingress = {}
              }
            }
          ]
        }
      }
      affinity = {
        nodeAffinity = {
          preferredDuringSchedulingIgnoredDuringExecution = [
            {
              weight = 100
              preference = {
                matchExpressions = [
                  {
                    key      = "node.exoscale.net/nodepool-id"
                    operator = NotIn
                    values   = [var.router_pool_id]
                  }
                ]
              }
            }
          ]
        }
      }
      cainjector = {
        affinity = {
          nodeAffinity = {
            preferredDuringSchedulingIgnoredDuringExecution = [
              {
                weight = 100
                preference = {
                  matchExpressions = [
                    {
                      key      = "node.exoscale.net/nodepool-id"
                      operator = NotIn
                      values   = [var.router_pool_id]
                    }
                  ]
                }
              }
            ]
          }
        }
      }
      webhook = {
        affinity = {
          nodeAffinity = {
            preferredDuringSchedulingIgnoredDuringExecution = [
              {
                weight = 100
                preference = {
                  matchExpressions = [
                    {
                      key      = "node.exoscale.net/nodepool-id"
                      operator = NotIn
                      values   = [var.router_pool_id]
                    }
                  ]
                }
              }
            ]
          }
        }
      }
    }
  }]
}
