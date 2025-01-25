# tf-az-module-azure-role-definition
Terraform module to create an azure ad role definition 


Manages a custom Role Definition, used to assign Roles to Users/Principals. See ['Understand role definitions'](https://docs.microsoft.com/azure/role-based-access-control/role-definitions) in the Azure documentation for more details.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#example-usage)

```hcl
data "azurerm_subscription" "primary" { } resource "azurerm_role_definition" "example" { name = "my-custom-role" scope = data.azurerm_subscription.primary.id description = "This is a custom role created via Terraform" permissions { actions = ["*"] not_actions = [] } assignable_scopes = [ data.azurerm_subscription.primary.id, # /subscriptions/00000000-0000-0000-0000-000000000000 ] }
```

## [Example Usage with Management Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#example-usage-with-management-group)

```hcl
data "azurerm_subscription" "current" { } resource "azurerm_management_group" "example" { display_name = "ParentGroup" subscription_ids = [ data.azurerm_subscription.current.subscription_id, ] } resource "azurerm_role_definition" "example" { name = "example-mg-role" scope = azurerm_management_group.example.id description = "Example custom role scoped to a management group." permissions { actions = ["Microsoft.Insights/alertRules/*", ] not_actions = [] } assignable_scopes = [ azurerm_management_group.example.id ] }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#argument-reference)

The following arguments are supported:

-   [`role_definition_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#role_definition_id-1) - (Optional) A unique UUID/GUID which identifies this role - one will be generated if not specified. Changing this forces a new resource to be created.
    
-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#name-1) - (Required) The name of the Role Definition.
    
-   [`scope`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#scope-1) - (Required) The scope at which the Role Definition applies to, such as `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333`, `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup`, `/providers/Microsoft.Management/managementGroups/0b1f6471-1bf0-4dda-aec3-111122223333`, or `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM`. It is recommended to use the first entry of the `assignable_scopes`. Changing this forces a new resource to be created.
    
-   [`description`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#description-1) - (Optional) A description of the Role Definition.
    
-   [`permissions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#permissions-1) - (Optional) A `permissions` block as defined below.
    
-   [`assignable_scopes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#assignable_scopes-1) - (Optional) One or more assignable scopes for this Role Definition, such as `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333`, `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup`, `/providers/Microsoft.Management/managementGroups/0b1f6471-1bf0-4dda-aec3-111122223333` , or `/subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM`.
    

___

A `permissions` block as the following properties:

-   [`actions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#actions-1) - (Optional) One or more Allowed Actions, such as `*`, `Microsoft.Resources/subscriptions/resourceGroups/read`. See ['Azure Resource Manager resource provider operations'](https://docs.microsoft.com/azure/role-based-access-control/resource-provider-operations) for details.
    
-   [`data_actions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#data_actions-1) - (Optional) One or more Allowed Data Actions, such as `*`, `Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read`. See ['Azure Resource Manager resource provider operations'](https://docs.microsoft.com/azure/role-based-access-control/resource-provider-operations) for details.
    
-   [`not_actions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#not_actions-1) - (Optional) One or more Disallowed Actions, such as `*`, `Microsoft.Resources/subscriptions/resourceGroups/read`. See ['Azure Resource Manager resource provider operations'](https://docs.microsoft.com/azure/role-based-access-control/resource-provider-operations) for details.
    
-   [`not_data_actions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#not_data_actions-1) - (Optional) One or more Disallowed Data Actions, such as `*`, `Microsoft.Resources/subscriptions/resourceGroups/read`. See ['Azure Resource Manager resource provider operations'](https://docs.microsoft.com/azure/role-based-access-control/resource-provider-operations) for details.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#id-1) - This ID is specific to Terraform - and is of the format `{roleDefinitionId}|{scope}`.
    
-   [`role_definition_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#role_definition_id-2) - The Role Definition ID. Changing this forces a new resource to be created.
    
-   [`role_definition_resource_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#role_definition_resource_id-1) - The Azure Resource Manager ID for the resource.
    

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#create-1) - (Defaults to 30 minutes) Used when creating the Role Definition.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#update-1) - (Defaults to 60 minutes) Used when updating the Role Definition.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#read-1) - (Defaults to 5 minutes) Used when retrieving the Role Definition.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#delete-1) - (Defaults to 30 minutes) Used when deleting the Role Definition.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition#import)

Role Definitions can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_role_definition.example "/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Authorization/roleDefinitions/00000000-0000-0000-0000-000000000000|/subscriptions/00000000-0000-0000-0000-000000000000"
```