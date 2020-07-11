#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   IBM Schematics: https://cloud.ibm.com/docs/terraform?topic=terraform-schematics-data-sources&-access-data-sources#schematics-workspace
#
#*****************************************************************************

data "ibm_schematics_workspace" "key_workspace" {
  workspace_id = var.key_ws_id
}

data "ibm_schematics_output" "key_workspace" {
  workspace_id = var.key_ws_id
  template_id  = element(data.ibm_schematics_workspace.key_workspace.template_id, 0)
}

data "ibm_schematics_workspace" "groups_workspace" {
  workspace_id = var.groups_ws_id
}

data "ibm_schematics_output" "groups_output" {
  workspace_id = var.groups_ws_id
  template_id  = element(data.ibm_schematics_workspace.groups_workspace.template_id, 0)
}
