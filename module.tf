resource "azurerm_role_definition" "role_definition" {
  role_definition_id = var.role_definition_id
  name        = module.role_definition_name.naming_convention_output[var.naming_convention_info.name].names.0
  scope       = var.scope
  description = var.description

  permissions {
    actions     = [var.permissions.actions]
    data_actions = [ var.permissions.data_actions ]
    not_actions = [var.permissions.not_actions]
    not_data_actions = [var.permissions.not_data_actions]
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}



