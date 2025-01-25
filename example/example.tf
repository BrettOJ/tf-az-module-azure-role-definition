data "azurerm_subscription" "primary" {
}

module "azurerm_role_definition" {
  source = "../"
  scope       = data.azurerm_subscription.primary.id
  description = var.description
  
    permissions = {
    actions     = var.permissions_actions
    data_actions = var.permissions_data_actions
    not_actions = var.permissions_not_actions
    not_data_actions = var.permissions_not_data_actions
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id, 
  ]
}