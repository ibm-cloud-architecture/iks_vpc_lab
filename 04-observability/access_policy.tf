##############################################################################
# LogDNA Access Policies
##############################################################################
/*
resource ibm_iam_access_group_policy logdna_labadmin_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labadmin_group_id}"
  roles           = ["${var.labadmin_access}"]
  resources = [{
    service              = "logdna"
    resource_instance_id = "${element(split(":", ibm_resource_instance.logdna.id), 7)}"
  }]
}

resource ibm_iam_access_group_policy logdna_labuser_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labuser_group_id}"
  roles           = ["${var.labuser_access}"]
  resources = [
    {
      service              = "logdna"
      resource_instance_id = "${element(split(":", ibm_resource_instance.logdna.id), 7)}"
  }]
}
##############################################################################


##############################################################################
# Sysdig Access Policies
##############################################################################
/*
resource ibm_iam_access_group_policy sysdig_labadmin_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labadmin_group_id}"
  roles           = ["${var.labadmin_access}"]
  resources = [{
    service              = "sysdig-monitor"
    resource_instance_id = "${element(split(":", ibm_resource_instance.sysdig-monitor.id), 7)}"
  }]
}
resource ibm_iam_access_group_policy sysdig_labuser_policy {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labuser_group_id}"
  roles           = ["${var.labuser_access}"]
  resources = [
    {
      service              = "sysdig-monitor"
      resource_instance_id = "${element(split(":", ibm_resource_instance.sysdig-monitor.id), 7)}"
  }]
}
##############################################################################
*/
