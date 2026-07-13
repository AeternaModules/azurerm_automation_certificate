variable "automation_certificates" {
  description = <<EOT
Map of automation_certificates, attributes below
Required:
    - automation_account_name
    - base64
    - base64_key_vault_id (optional, alternative to base64)
    - base64_key_vault_secret_name (optional, alternative to base64)
    - name
    - resource_group_name
Optional:
    - description
    - exportable
EOT

  type = map(object({
    automation_account_name      = string
    base64                       = string
    base64_key_vault_id          = optional(string)
    base64_key_vault_secret_name = optional(string)
    name                         = string
    resource_group_name          = string
    description                  = optional(string)
    exportable                   = optional(bool)
  }))
  validation {
    condition = alltrue([
      for k, v in var.automation_certificates : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_certificates : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_certificates : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_certificates : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_certificates : (
        length(v.automation_account_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_certificates : (
        can(base64decode(v.base64))
      )
    ])
    error_message = "must be valid base64"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

