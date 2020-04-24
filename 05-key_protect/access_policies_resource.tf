#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   IBM IAM:        https://cloud.ibm.com/docs/terraform?topic=terraform-iam-resources&-access-data-sources#iam-access-group
#*****************************************************************************


/*
##############################################################################
# Key Protect Access Policies
# examples that you can use
##############################################################################


resource ibm_iam_access_group_policy labadmin_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labadmin_group_id}"
  roles           = ["${var.labadmin_access}"]

  resources = [{
    service              = "kms"
    resource_instance_id = "${element(split(":", ibm_resource_instance.kms.id), 7)}"
  }]
}

resource ibm_iam_access_group_policy kms_engineer_access_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labuser_group_id}"
  roles           = ["${var.labuser_access}"]

  resources = [{
    service              = "kms"
    resource_instance_id = "${element(split(":", ibm_resource_instance.kms.id), 7)}"
  }]
}

##############################################################################
*/
