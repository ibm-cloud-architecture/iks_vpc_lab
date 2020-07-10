############################################################################################################
# 04-observability  Creates the Monitoring and Logging Services
#
# Depends on:
#    schematics.tf - provides the output data from the 01-groups and 03-iks_cluster Schematics workspaces
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#   This file creates the monitoring (ibm_resource_instance.sysdig), 
#   logDNA (ibm_resource_instance.logdna) and 
#   activity tracker (ibm_resource_instance.iks_on_vpc_activity_tracker) resource
#   instances. Private service end points created if supported.
#   Secret keys and agents installed on VSI for montioring and logging.
#
# Outputs: 
#  see outputs.tf
#
# References:
#   Resource Key:      https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resource-key
#   Resource Instance: https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resouce-instance
###########################################################################################################

##############################################################################
# Create Activity Tracker with LogDNA instance
# This is commented as only one instance per region is allowed
##############################################################################
/*
resource "ibm_resource_instance" "iks_on_vpc_activity_tracker" {
  name              = "${var.unique_id}-activity-tracker"
  service           = "logdnaat"
  plan              = "${var.logging_plan}"
  location          = "${var.ibm_region}"
  resource_group_id = "${data.ibm_schematics_output.groups_output.output_values.resource_group_id}"
  tags              = ["iks-on-vpc"]

  parameters = {
    service-endpoints = "${var.end_points}"
  }

}
*/
##############################################################################


##############################################################################
# create LogDNA instance
##############################################################################

resource "ibm_resource_instance" "logdna" {

  name              = "${var.unique_id}-logdna"
  service           = "logdna"
  plan              = var.logging_plan
  location          = var.ibm_region
  resource_group_id = data.ibm_schematics_output.groups_output.output_values.resource_group_id
  tags              = ["iks-on-vpc"]

}

##############################################################################


##############################################################################
# Create logAnalysis instance access key
##############################################################################

resource "ibm_resource_key" "logdna_secret" {
  name                 = "${var.unique_id}_logdna_key"
  role                 = var.log_role
  resource_instance_id = ibm_resource_instance.logdna.id
}

##############################################################################
