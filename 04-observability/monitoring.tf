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
# Create monitoring with sysdig instance
##############################################################################

resource "ibm_resource_instance" "sysdig" {
  name              = "${var.unique_id}-sysdig"
  location          = "${var.ibm_region}"
  service           = "sysdig-monitor"
  plan              = "${var.monitor_plan}"
  resource_group_id = "${data.ibm_schematics_output.groups_output.output_values.resource_group_id}"
  tags              = ["iks-on-vpc"]
}

##############################################################################


##############################################################################
# Create monitoring with Sysdig instance access key
##############################################################################

resource "ibm_resource_key" "sysdig_secret" {
  name                 = "${var.unique_id}_monitor_key"
  role                 = "${var.log_role}"
  resource_instance_id = "${ibm_resource_instance.sysdig.id}"
}

##############################################################################
