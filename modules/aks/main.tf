data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

data "azurerm_subscription" "primary" {
}

resource "azurerm_user_assigned_identity" "cert_manager" {
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
  name                = "cert-manager"
}

module "cert-manager" {
  source = "../"

  cluster_name     = var.cluster_name
  base_domain      = var.base_domain
  argocd_namespace = var.argocd_namespace

  namespace = var.namespace

  helm_values_overrides = concat(local.helm_values_overrides, var.helm_values_overrides)
}
