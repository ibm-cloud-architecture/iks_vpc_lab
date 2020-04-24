#####################################################
# Retrieve the output from the groups workspace
#####################################################

data "ibm_schematics_workspace" "groups_workspace" {
  workspace_id = "${var.groups_ws_id}"
}

data "ibm_schematics_output" "groups_output" {
  workspace_id = "${var.groups_ws_id}"
  template_id  = "${data.ibm_schematics_workspace.groups_workspace.template_id.0}"
}
