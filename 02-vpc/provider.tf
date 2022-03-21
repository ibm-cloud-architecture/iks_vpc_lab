##############################################################################################################################################
# IBM Cloud Provider. Use this block to set the IBM Cloud as a provider
# Documentation Block References
# https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-about
# https://cloud.ibm.com/docs/ibm-cloud-provider-for-terraform?topic=ibm-cloud-provider-for-terraform-provider-reference#provider-parameter-ov
##############################################################################################################################################

provider "ibm" {
  region             = var.ibm_region
  ibmcloud_timeout   = 60
}

