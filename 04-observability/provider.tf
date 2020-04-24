##############################################################################
# IBM Cloud Provider. Use this block to set the IBM Cloud as a provider
# Documentation Block References
# https://cloud.ibm.com/docs/terraform?topic=terraform-provider-reference&-access-data-sources
##############################################################################

provider "ibm" {
  region           = "${var.ibm_region}"
  generation       = 2
  ibmcloud_timeout = 60
}

provider "kubernetes" {
  load_config_file       = false
  host                   = "${data.ibm_schematics_output.iks_workspace.output_values.host}"
  client_certificate     = "${data.ibm_schematics_output.iks_workspace.output_values.client_certificate}"
  client_key             = "${data.ibm_schematics_output.iks_workspace.output_values.client_key}"
  cluster_ca_certificate = "${data.ibm_schematics_output.iks_workspace.output_values.cluster_ca_certificate}"
}
