output "automation_certificates_id" {
  description = "Map of id values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.id }
}
output "automation_certificates_automation_account_name" {
  description = "Map of automation_account_name values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.automation_account_name }
}
output "automation_certificates_base64" {
  description = "Map of base64 values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.base64 }
  sensitive   = true
}
output "automation_certificates_description" {
  description = "Map of description values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.description }
}
output "automation_certificates_exportable" {
  description = "Map of exportable values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.exportable }
}
output "automation_certificates_name" {
  description = "Map of name values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.name }
}
output "automation_certificates_resource_group_name" {
  description = "Map of resource_group_name values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.resource_group_name }
}
output "automation_certificates_thumbprint" {
  description = "Map of thumbprint values across all automation_certificates, keyed the same as var.automation_certificates"
  value       = { for k, v in azurerm_automation_certificate.automation_certificates : k => v.thumbprint }
}

