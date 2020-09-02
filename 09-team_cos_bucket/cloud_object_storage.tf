#########################################################################################################
# 09-team_cos_bucket Creates the team Cloud Object Storage bucket
#
# Depends on:
#    schematics.tf - provides the output data from the 01-groups, 05_key_protect 
#                    and 06_object_storage schematics workspaces
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#   Create COS Bucket (ibm_cos_bucket.cos_bucket) with random id to ensure uniqueness 
#
# Outputs: 
#  see outputs.tf
#
# References:
#   Object Storage: https://cloud.ibm.com/docs/terraform?topic=terraform-object-storage-resources&-access-data-sources#cos-bucket
#########################################################################################################

##############################################################################
# Create COS Bucket with random id to ensure uniqueness
##############################################################################

resource ibm_cos_bucket cos_bucket {
  key_protect          = data.ibm_schematics_output.key_workspace.output_values.kms_id
  bucket_name          = var.cos_bucket_name
  resource_instance_id = data.ibm_schematics_output.cos_workspace.output_values.cos_id
  region_location      = var.ibm_region
  storage_class        = var.cos_bucket_storage_class
}

##############################################################################


