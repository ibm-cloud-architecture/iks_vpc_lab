#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   IBM IAM:        https://cloud.ibm.com/docs/terraform?topic=terraform-iam-resources&-access-data-sources#iam-access-group
#*****************************************************************************
##############################################################################
# IKS Access Group Policies
# This is an example of the policies you can use when provisioning service instances
##############################################################################
/*
resource ibm_iam_access_group_policy iks_labadmin_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labadmin_group_id}"
  roles           = ["${var.labadmin_access}"]

  resources = [{
    service              = "containers-kubernetes"
    resource_instance_id = "${ibm_container_vpc_cluster.cluster.id}"
  }]
}

resource ibm_iam_access_group_policy iks_labusers_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labuser_group_id}"
  roles           = ["${var.labuser_access}"]

  resources = [{
    service              = "containers-kubernetes"
    resource_instance_id = "${ibm_container_vpc_cluster.cluster.id}"
  }]
}

##############################################################################


##############################################################################
# IKS Service ID Policy
##############################################################################

resource ibm_iam_service_policy service_id_policy {
  iam_service_id = "${data.ibm_schematics_output.groups_output.output_values.service_id}"
  roles          = ["Manager", "Viewer", "Administrator"]

  resources = [{
    service              = "containers-kubernetes"
    resource_instance_id =  "${ibm_container_vpc_cluster.cluster.id}"
  }]
}
##############################################################################
*/
