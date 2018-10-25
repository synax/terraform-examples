
module "vnet-1" {
  source = "vnet"
  
  location = "${var.location}"
}


module "network" {
    source              = "Azure/network/azurerm"
    version             = "~> 1.1.1"
    location            = "${var.location}"
    allow_rdp_traffic   = "false"
    allow_ssh_traffic   = "true"
    resource_group_name = "terraform-compute"
  }


module "linuxservers" {
    source              = "Azure/compute/azurerm"
    location            = "${var.location}"
    vm_os_simple        = "UbuntuServer"
    public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
    vnet_subnet_id      = "${module.network.vnet_subnets[0]}"
}
  