#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   IKS Data: https://cloud.ibm.com/docs/terraform?topic=terraform-container-data-sources&-access-data-sources#container-cluster-config
#*****************************************************************************

##############################################################################`
# Gets cluster config and downloads it to .kube/config
# Waits for cluster name before starting
##############################################################################`

data ibm_container_cluster_config cluster {

  cluster_name_id   = "${data.ibm_schematics_output.iks_workspace.output_values.cluster_id}"
  admin             = true
  resource_group_id = "${data.ibm_schematics_output.groups_output.output_values.resource_group_id}"

}
