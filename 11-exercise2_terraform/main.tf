#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   IBM Provider:    https://cloud.ibm.com/docs/terraform?topic=terraform-provider-reference&-access-data-sources
#   Resource Group:  https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resource-group
#
#   Database :       https://cloud.ibm.com/docs/terraform?topic=terraform-databases-resources#db
#   Access Group:    https://cloud.ibm.com/docs/terraform?topic=terraform-iam-resources&-access-data-sources#iam-access-group-policy
#*****************************************************************************

##############################################################################
# IBM Cloud Provider
##############################################################################

provider "ibm" {
  region             = "${var.ibm_region}"
  generation         = 2
  ibmcloud_timeout   = 60
}

##############################################################################



##############################################################################
# Resource group ID from name
##############################################################################
data "ibm_resource_group" "group" {
  name = "${var.resource_group_name}"
}
##############################################################################


##############################################################################
# Provision database instance
##############################################################################
resource "ibm_database" "db_instance" {
  name              = "${var.db_name}"
  plan              = "${var.plan}"
  location          = "${var.ibm_region}"
  service           = "databases-for-postgresql"
  resource_group_id = "${data.ibm_resource_group.group.id}"

  adminpassword                = "${var.db_admin_password}"
  members_memory_allocation_mb = "${var.db_memory_allocation}"
  members_disk_allocation_mb   = "${var.db_disk_allocation}"
  users {
    name     = "${var.user_username}"
    password = "${var.user_password}"
  }
}
##############################################################################


##############################################################################
# Grant Lab User Access to Database
# For lab simplification, this block is not used. During lab setup we set the
# access for you to use. In your team, you can assign access policies at the
# account, resource group, service, instance using this type of block.
##############################################################################
# resource "ibm_iam_access_group_policy" "ex2_db_policy" {
#  access_group_id = ibm_iam_access_group.labuser.id
#  roles        = ["Reader"]

#  resources = [{
#    service = "databases-for-postgresql"
#    resource_instance_id = element(split(":", ibm_database.db_instance.id),7)
#  }
#  ]
# }
##############################################################################
