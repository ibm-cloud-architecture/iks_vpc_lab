#*****************************************************************************
# References:
#   IKS Container Bind: https://cloud.ibm.com/docs/terraform?topic=terraform-container-resources&-access-data-sources#container-bind
#*****************************************************************************


##############################################################################
# Bind the database and the cloud object storage to the kubernetes namespace
##############################################################################

resource ibm_container_bind_service bind_postgres_to_namespace {

  cluster_name_id     = "${data.ibm_schematics_output.iks_workspace.output_values.cluster_id}"
  service_instance_id = "${data.ibm_schematics_output.db_workspace.output_values.psql_id}"
  namespace_id        = "${var.namespace}"
  resource_group_id   = "${data.ibm_schematics_output.groups_workspace.output_values.resource_group_id}"

  depends_on = ["kubernetes_network_policy.deny_traffic_namespace"]

}

resource ibm_container_bind_service bind_cosbucket_to_namespace {

  cluster_name_id     = "${data.ibm_schematics_output.iks_workspace.output_values.cluster_id}"
  service_instance_id = "${data.ibm_schematics_output.cos_workspace.output_values.cos_id}"
  namespace_id        = "${var.namespace}"
  resource_group_id   = "${data.ibm_schematics_output.groups_workspace.output_values.resource_group_id}"

  depends_on = ["kubernetes_network_policy.deny_traffic_namespace"]
}

##############################################################################
