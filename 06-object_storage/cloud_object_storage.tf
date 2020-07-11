####################################################################################################
# 06-cloud_object_storage  Creates the cloud object storage
#
# Depends on:
#    schematics.tf - provides the output data from 01-groups Schematics workspace
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
# - creates a cloud object storage instance and a bucket, (ibm_resource_instance.cos)
# - creates three block volumes used by the VSI in each zone.
#
# Outputs: 
#  see outputs.tf
#
# References:
#   IBM IAM: https://cloud.ibm.com/docs/terraform?topic=terraform-iam-resources&-access-data-sources#iam-auth-policy
#   Resource Instance: https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resouce-instance
#####################################################################################################


##############################################################################
# Create COS instance 
##############################################################################

resource ibm_resource_instance cos {
  name              = "${var.unique_id}-cos"
  service           = "cloud-object-storage"
  plan              = var.cos_plan
  location          = "global"
  resource_group_id = data.ibm_schematics_output.groups_output.output_values.resource_group_id
  tags              = ["iks-on-vpc"]

  parameters = {
    service-endpoints = var.end_points
    key_protect_key   = data.ibm_schematics_output.key_workspace.output_values.kms_key_id
  }

  //User can increase timeouts 
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

##############################################################################


##############################################################################
# Policy for KMS
##############################################################################

resource ibm_iam_authorization_policy cos_policy {
  source_service_name         = "cloud-object-storage"
  source_resource_instance_id = ibm_resource_instance.cos.id
  target_service_name         = "kms"
  target_resource_instance_id = data.ibm_schematics_output.key_workspace.output_values.kms_id
  roles                       = ["Reader"]
}

##############################################################################
