variable "role_definition_id" {
  description = "A unique UUID/GUID which identifies this role - one will be generated if not specified."
  type        = string
  default     = null
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

variable "permissions" {
  description = "A permissions block as defined below."
  type        = object({
    actions = list(string)
    data_actions = list(string)
    not_actions = list(string)
    not_data_actions = list(string)
  })
  default     = null
}

variable "assignable_scopes" {
  description = "One or more assignable scopes for this Role Definition, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, /providers/Microsoft.Management/managementGroups/0b1f6471-1bf0-4dda-aec3-111122223333 , or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM."
  type        = list(string)
}


