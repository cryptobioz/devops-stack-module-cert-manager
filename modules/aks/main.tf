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

  cluster_info = var.cluster_info

  namespace = var.namespace

  extra_yaml = concat([templatefile("${path.module}/values.tmpl.yaml", {
    cluster_info             = var.cluster_info
    cert_manager_resource_id = azurerm_user_assigned_identity.cert_manager.id
    cert_manager_client_id   = azurerm_user_assigned_identity.cert_manager.client_id
    subscription_id          = split("/", data.azurerm_subscription.primary.id)[2]
    resource_group_name      = data.azurerm_resource_group.this.name
  })], var.extra_yaml)
}
