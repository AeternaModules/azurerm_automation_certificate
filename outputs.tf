output "automation_certificates" {
  description = "All automation_certificate resources"
  value       = azurerm_automation_certificate.automation_certificates
  sensitive   = true
}
output "automation_certificates_automation_account_name" {
  description = "List of automation_account_name values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.automation_account_name]
}
output "automation_certificates_base64" {
  description = "List of base64 values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.base64]
  sensitive   = true
}
output "automation_certificates_description" {
  description = "List of description values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.description]
}
output "automation_certificates_exportable" {
  description = "List of exportable values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.exportable]
}
output "automation_certificates_name" {
  description = "List of name values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.name]
}
output "automation_certificates_resource_group_name" {
  description = "List of resource_group_name values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.resource_group_name]
}
output "automation_certificates_thumbprint" {
  description = "List of thumbprint values across all automation_certificates"
  value       = [for k, v in azurerm_automation_certificate.automation_certificates : v.thumbprint]
}

