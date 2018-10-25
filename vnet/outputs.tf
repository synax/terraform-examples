
output "subnet_ids" {
  value = ["${azurerm_subnet.test.*.id}"]
}

output "subnet_cidrs" {
  value = ["${azurerm_subnet.test.*.address_prefix}"]
}

output "subnet_names" {
  value = ["${azurerm_subnet.test.*.name}"]
}
