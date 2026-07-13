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
  # --- Unconfirmed validation candidates, derived from azurerm_automation_certificate's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: automation_account_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: base64
  #   source:    validation.StringIsBase64(...) - no translation rule yet, add one
}

