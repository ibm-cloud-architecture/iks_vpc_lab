####################################################################################################
# 05-key_protect  Creates key protect key
#
# Depends on:
#    schematics.tf - provides the output data from 01-groups Schematics workspace
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#   - Create Key Protect Instance (ibm_resource_instance.kms)
#   - Create a Key Protect Root Key (ibm_kp_key.key)
#
# Outputs: 
#  see outputs.tf
#
# References:
#   Resource Instance: https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resouce-instance
#   Key Protect:       https://cloud.ibm.com/docs/terraform?topic=terraform-kp-resources&-access-data-sources#kp-key
#####################################################################################################


##############################################################################
# Create Key Protect Instance
##############################################################################

resource ibm_resource_instance kms {
  name              = "${var.unique_id}-kms"
  service           = "kms"
  plan              = var.kms_plan
  location          = var.ibm_region
  resource_group_id = data.ibm_schematics_output.groups_output.output_values.resource_group_id
  tags              = ["iks-on-vpc"]

  parameters = {
    service-endpoints = "private"
  }

}

##############################################################################


##############################################################################
# Create a Key Protect Root Key
##############################################################################

resource ibm_kp_key key {
  key_protect_id = ibm_resource_instance.kms.guid
  key_name       = var.kms_root_key_name
  standard_key   = false
}
