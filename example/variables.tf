variable "role_definition_id" {
  description = "A unique UUID/GUID which identifies this role - one will be generated if not specified."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the Role Definition."
  type        = string
}

variable "scope" {
  description = "The scope at which the Role Definition applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, /providers/Microsoft.Management/managementGroups/0b1f6471-1bf0-4dda-aec3-111122223333, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. It is recommended to use the first entry of the assignable_scopes."
  type        = string
}

variable "description" {
  description = "A description of the Role Definition."
  type        = string
  default     = null
}

variable "assignable_scopes" {
  description = "One or more assignable scopes for this Role Definition, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, /providers/Microsoft.Management/managementGroups/0b1f6471-1bf0-4dda-aec3-111122223333 , or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM."
  type        = list(string)
}

variable "permissions_actions" {
  description = "One or more Allowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. See 'Azure Resource Manager resource provider operations' for details."
  type        = list(string)
  default     = null
}

variable "permissions_data_actions" {
  description = "One or more Allowed Data Actions, such as *, Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read. See 'Azure Resource Manager resource provider operations' for details."
  type        = list(string)
  default     = null
}

variable "permissions_not_actions" {
  description = "One or more Disallowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. See 'Azure Resource Manager resource provider operations' for details."
  type        = list(string)
  default     = null
}

variable "permissions_not_data_actions" {
  description = "One or more Disallowed Data Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. See 'Azure Resource Manager resource provider operations' for details."
  type        = list(string)
  default     = null
}

