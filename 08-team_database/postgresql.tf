#########################################################################################################
# 08-team_database Creates the team PostgresSQL Database
#
# Depends on:
#    schematics.tf - provides the output data from the 01-groups and 05_key_protect schematics workspaces
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#  This file creates the PostgresSQL Database (ibm_database.postgresql), creates a user 
#  with Postgres rbac, assign IAM policies
#   
# Outputs: 
#  see outputs.tf
#
# References:
#   Resource Instance: https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resouce-instance
#   Certificate Mgr:   https://cloud.ibm.com/docs/terraform?topic=terraform-cert-manager-resources&-access-data-sources#cert-manager
#########################################################################################################

##############################################################################
# Create Postgresql database
##############################################################################

resource "ibm_database" "postgresql" {
# depends_on        = ["ibm_iam_authorization_policy.psql_policy"]
  name              = "${var.unique_id}-postgres"
  service           = "databases-for-postgresql"
  plan              = "${var.postgres_plan}"
  location          = "${var.ibm_region}"
  resource_group_id = "${data.ibm_schematics_output.groups_output.output_values.resource_group_id}"
  tags              = ["iks-on-vpc"]
  service_endpoints = "${var.end_points}"
  key_protect_key   = "${data.ibm_schematics_output.key_workspace.output_values.kms_key_id}"

  //User can increase timeouts
  timeouts {
    create = "45m"
    update = "15m"
    delete = "15m"
  }
}

##############################################################################


##############################################################################
# Policy for KMS - for this lab this policy will not be applied as the lab
# has a policy for lab user and admin applied to ensure resource group
##############################################################################
/*
resource "ibm_iam_authorization_policy" "psql_policy" {
  source_service_name         = "databases-for-postgresql"
  # source_resource_instance_id = "${ibm_database.postgresql.id}"
  target_service_name         = "kms"
  # target_resource_instance_id = "${data.ibm_schematics_output.key_workspace.output_values.kms_id}"
  roles                       = ["Reader"]
}
*/
##############################################################################


##############################################################################
# Postgresql Secret
##############################################################################
resource "ibm_resource_key" "postgresql_secret" {
  name                 = "${var.postgres_secret_name}"
  role                 = "Administrator"
  resource_instance_id = "${ibm_database.postgresql.id}"
}

##############################################################################
