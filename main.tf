module "resource_group" {
  source = "git::https://github.com/sbonnet-dev/terraform-module-azure_resource_group.git?ref=main"

  name = "webserver"
}

module "storage_account" {
  source = "git::https://github.com/sbonnet-dev/terraform-module-storage_account.git?ref=main"

  name    = "sa"
  rg_name = module.resource_group.resource_group_name

  owner   = "seb"
  project = "webserver"
  
  depends_on = [
    module.resource_group
  ]
}

module "virtual_network" {
  source = "git::https://github.com/sbonnet-dev/terraform-module-virtual_network.git?ref=main"

  name    = "vn"
  rg_name = module.resource_group.resource_group_name
  
  owner   = "seb"
  project = "webserver"

  depends_on = [
    module.resource_group
  ]
}

module "public_ip" {
  source = "git::https://github.com/sbonnet-dev/terraform-module_public_ip.git?ref=main"

  name    = "pub"
  rg_name = module.resource_group.resource_group_name
  
  owner   = "seb"
  project = "webserver"

  depends_on = [
    module.resource_group
  ]
}

module "network_interface" {
  source = "git::https://github.com/sbonnet-dev/terraform-module_network_interface.git?ref=main"

  name    = "pub"
  rg_name = module.resource_group.resource_group_name
  
  owner   = "seb"
  project = "webserver"

  depends_on = [
    module.resource_group
  ]
}
