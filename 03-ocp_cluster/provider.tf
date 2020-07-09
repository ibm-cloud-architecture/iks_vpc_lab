##############################################################################
# IBM Cloud Provider. Use this block to set the IBM Cloud as a provider
# Documentation Block References
# https://cloud.ibm.com/docs/terraform?topic=terraform-provider-reference&-access-data-sources
##############################################################################

provider "ibm" {
  region           = var.ibm_region
  generation       = 2
  ibmcloud_timeout = 60
}

