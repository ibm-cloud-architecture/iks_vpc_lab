###################################################################################################
# 03-iks_cluster  Creates the IKS Cluster
#
# Depends on:
#    schematics.tf - provides the output data from the 01-groups and 02-vpc Schematics workspaces
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#   Creates an IKS cluster (ibm_container_vpc_cluster.cluster) and 
#   Container Registry ( ibm_resource_instance.docker_registry) in the VPC Cluster
#    
# Outputs: 
#  see outputs.tf
#
# References:
#   IKS/VPC: https://cloud.ibm.com/docs/terraform?topic=terraform-container-resources&-access-data-sources#vpc-cluster
##################################################################################################

##############################################################################
# Provison IKS on VPC Cluster
##############################################################################

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "${var.cluster_name}"
  vpc_id            = "${data.ibm_schematics_output.vpc_workspace.output_values.vpc_id}"
  flavor            = "${var.machine_type}"
  worker_count      = "${var.worker_count}"
  resource_group_id = "${data.ibm_schematics_output.groups_output.output_values.resource_group_id}"
  kube_version      = "1.17.5"

  zones {
 #  subnet_id = element(data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids, 0)
    subnet_id = "${data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids[0]}"
    name      = "${var.ibm_region}-1"
  }
  zones {
#   subnet_id = element(data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids, 1)
    subnet_id = "${data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids[1]}"
    name      = "${var.ibm_region}-2"
  }
  zones {
#   subnet_id = element(data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids, 2)
    subnet_id = "${data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids[2]}"
    name      = "${var.ibm_region}-3"
  }
}
