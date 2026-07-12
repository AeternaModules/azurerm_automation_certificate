data "azurerm_key_vault_secret" "base64" {
  for_each     = { for k, v in var.automation_certificates : k => v if v.base64_key_vault_id != null && v.base64_key_vault_secret_name != null }
  name         = each.value.base64_key_vault_secret_name
  key_vault_id = each.value.base64_key_vault_id
}
resource "azurerm_automation_certificate" "automation_certificates" {
  for_each = var.automation_certificates

  automation_account_name = each.value.automation_account_name
  base64                  = each.value.base64 != null ? each.value.base64 : try(data.azurerm_key_vault_secret.base64[each.key].value, null)
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  exportable              = each.value.exportable
}

