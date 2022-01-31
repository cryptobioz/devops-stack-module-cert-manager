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
  profiles  = var.profiles

  extra_yaml = concat([templatefile("${path.module}/values.tmpl.yaml", {
    base_domain              = var.base_domain
    cert_manager_resource_id = azurerm_user_assigned_identity.cert_manager.id
    cert_manager_client_id   = azurerm_user_assigned_identity.cert_manager.client_id
    subscription_id          = split("/", data.azurerm_subscription.primary.id)[2]
    resource_group_name      = data.azurerm_resource_group.this.name
  })], var.extra_yaml)
}
