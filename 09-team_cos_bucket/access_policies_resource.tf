#*****************************************************************************
# References:
#   IBM IAM:   https://cloud.ibm.com/docs/terraform?topic=terraform-iam-resources&-access-data-sources#iam-access-group
#*****************************************************************************

##############################################################################
# Apply access policy to ICOS bucket
##############################################################################
/*
resource ibm_iam_access_group_policy bucket_labuser_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labdev_group_id}"
  roles           = ["${var.labuser_access}"]

  resources = [
    {
      service              = "cloud-object-storage"
      resource_instance_id = "${data.ibm_schematics_output.cos_workspace.output_values.cos_id}"
      resource_type        = "bucket"
      resource             = "${ibm_cos_bucket.cos_bucket.bucket_name}"
    }
  ]
}

##############################################################################


##############################################################################
# Apply service ID access policy to ICOS bucket
##############################################################################

resource ibm_iam_service_policy bucket_admin_policy {

  iam_service_id = "${data.ibm_schematics_output.groups_output.output_values.service_id}"
  roles          = ["${var.labadmin_access}"]

  resources = [
    {
      service              = "cloud-object-storage"
      resource_instance_id = "${data.ibm_schematics_output.cos_workspace.output_values.cos_id}"
      resource_type        = "bucket"
      resource             = "${ibm_cos_bucket.cos_bucket.bucket_name}"
    }
  ]

}

##############################################################################

*/
