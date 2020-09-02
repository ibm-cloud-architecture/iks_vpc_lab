#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   IKS Data: https://cloud.ibm.com/docs/terraform?topic=terraform-container-data-sources&-access-data-sources#container-cluster-config
#*****************************************************************************

##############################################################################`
# Gets cluster config and downloads it to .kube/config
# Waits for cluster name before starting
##############################################################################`

data "ibm_container_cluster_config" "cluster" {
  cluster_name_id   = ibm_container_vpc_cluster.cluster.id
  admin             = true
  resource_group_id = data.ibm_schematics_output.groups_output.output_values.resource_group_id
}

/*
// https://cloud.ibm.com/docs/terraform?topic=terraform-container-data-sources#container-cluster
provider "kubernetes" {
  load_config_file       = "false"
  host                   = data.ibm_container_vpc_cluster.cluster.host
  client_certificate     = data.ibm_container_vpc_cluster.cluster.admin_certificate
  client_key             = data.ibm_container_vpc_cluster.cluster.admin_key
  cluster_ca_certificate = data.ibm_container_vpc_cluster.cluster.ca_certificate

  token                  = data.ibm_container_vpc_cluster.cluster.token
}
*/
