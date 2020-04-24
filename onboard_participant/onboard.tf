##############################################################################
# Create resource group for lab participant to use in exercise 2
##############################################################################
resource "ibm_resource_group" "exer2_resource_group" {
  name     = "${var.resource_group_name}-exercise2"
}

##############################################################################
# Create access group for lab participant to use in exercise 2
##############################################################################

resource ibm_iam_access_group exer2_access {
  name = "${var.resource_group_name}-exer2"
  tags = ["iks-on-vpc"]
}

##############################################################################
# Create user policy as Reader and Viewer for all services in their resource group
# This is a blanket policy for all resources in the group
##############################################################################

resource "ibm_iam_access_group_policy" "exer2_viewer_policy" {
  access_group_id = "${ibm_iam_access_group.exer2_access.id}"
  roles        = ["Reader", "Viewer"]

  resources {
    resource_group_id = "${ibm_resource_group.exer2_resource_group.id}"
  }
}

##############################################################################
# Create user policy as Operator for Postgresql in their resource group
# This enables the lab participant to provision, change and delete an instance
# in exercise 2
##############################################################################

resource "ibm_iam_access_group_policy" "exer2_psg_policy" {
  access_group_id = "${ibm_iam_access_group.exer2_access.id}"
  roles        = ["Editor"]

  resources {
    service           = "databases-for-postgresql"
    resource_group_id = "${ibm_resource_group.exer2_resource_group.id}"
  }
}

##############################################################################
# Create user policy as Reader and Writer for Schematics in their resource group
# This enables the lab participate to run plan, apply, destroy and edit values
##############################################################################

resource "ibm_iam_access_group_policy" "exer2_sch_policy" {
  access_group_id = "${ibm_iam_access_group.exer2_access.id}"
  roles        = ["Viewer", "Writer"]

  resources {
    service           = "schematics"
    resource_group_id = "${ibm_resource_group.exer2_resource_group.id}"
  }
}



##############################################################################
# Add the lab user to each access group (lab and for exercise 2  
# so they can view resources and perform actions in exercise 2
##############################################################################

resource "ibm_iam_access_group_members" "add_user_lab" {
  access_group_id = "${data.ibm_schematics_output.groups_output.output_values.labuser_group_id}"
  ibm_ids         = ["${var.labuser_id}"]
}

resource "ibm_iam_access_group_members" "add_user_exer2" {
  access_group_id = "${ibm_iam_access_group.exer2_access.id}"
  ibm_ids         = ["${var.labuser_id}"]
}
