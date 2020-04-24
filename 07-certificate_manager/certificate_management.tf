#########################################################################################################
# 07-certificate_manager Creates certificate manager and import a certificate
#
# Depends on:
#    schematics.tf - provides the output data from the 01-groups and 03-iks_cluster schematics workspace
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#   This file creates the IBM Certificate manager (ibm_resource_instance.cms) resource instance.
#   In the additional files, this module also create and Imports ssl cert for testing and load 
#   certificate to CMS.
#  
# Outputs: 
#  see outputs.tf
#
# References:
#   Resource Instance: https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resouce-instance
#   Certificate Mgr:   https://cloud.ibm.com/docs/terraform?topic=terraform-cert-manager-resources&-access-data-sources#cert-manager
#########################################################################################################

##############################################################################
# Create certificate manager 
##############################################################################

resource ibm_resource_instance cms {
  name              = "${var.unique_id}-cms"
  service           = "cloudcerts"
  plan              = "${var.cms_plan}"
  location          = "${var.ibm_region}"
  resource_group_id = "${data.ibm_schematics_output.groups_output.output_values.resource_group_id}"
  tags              = ["iks-on-vpc"]

  parameters = {
    "HMAC"            = true,
    service-endpoints = "${var.end_points}"
  }

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
##############################################################################


################################################################################
# Create and Import ssl cert for testing and load certificate to CMS
################################################################################

resource "null_resource" "import" {
  provisioner "local-exec" {
    command = <<EOT
    openssl req -x509  \
          -newkey rsa:1024 \
          -keyout "${var.key}" \
          -out "${var.cert}" \
          -days 1 -nodes \
          -subj "/C=us/ST=${var.ibm_region}/L=Dal-10/O=IBM/OU=CloudCerts/CN=*.containers.appdomain.cloud" 
      EOT
  }
}
data "local_file" "cert" {
  filename   = "${path.module}/${var.cert}"
  depends_on = ["null_resource.import"]
}
data "local_file" "key" {
  filename   = "${path.module}/${var.key}"
  depends_on = ["null_resource.import"]
}
resource "ibm_certificate_manager_import" "cert" {
  certificate_manager_instance_id = "${ibm_resource_instance.cms.id}"
  name                            = "test"
  data = {
    content  = "${data.local_file.cert.content}"
    priv_key = "${data.local_file.key.content}"
  }
}


################################################################################
