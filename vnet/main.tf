# Configure the Azure Provider
provider "azurerm" {}



resource "azurerm_resource_group" "test" {
  name     = "itx-test-${var.location}-rg"
  location = "${var.location}"

  tags = {
      app = "test"
      cost-center = "foo"
      department = "foo-bar"
  }
}

resource "azurerm_virtual_network" "test" {
  name                = "acceptanceTestVirtualNetwork1"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
}

resource "azurerm_subnet" "test" {
  count                = "${var.subnet_count}"
  name                 = "testsubnet-${count.index}"
  resource_group_name  = "${azurerm_resource_group.test.name}"
  virtual_network_name = "${azurerm_virtual_network.test.name}"
  address_prefix       = "10.0.${count.index}.0/24"
}


