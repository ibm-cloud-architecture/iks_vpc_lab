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
#   Creates an OCP (ROCKS) cluster (ibm_container_vpc_cluster.cluster) and 
#   Container Registry ( ibm_resource_instance.docker_registry) in the VPC Cluster
#    
# Outputs: 
#  see outputs.tf
#
# References:
#   IKS/VPC: https://cloud.ibm.com/docs/terraform?topic=terraform-container-resources#gen2-openshift
##################################################################################################

##############################################################################
# Provison ROCKs cluster  on VPC Cluster
##############################################################################

# RedHat Cluster requires Cloud Object Storage instance
resource "ibm_resource_instance" "rh_cos_instance" {
  name              = "${var.unique_id}-rh-cos"
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = data.ibm_schematics_output.groups_output.output_values.resource_group_id
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "${var.unique_id}-${var.cluster_name}"
  vpc_id            = data.ibm_schematics_output.vpc_workspace.output_values.vpc_id
  flavor            = var.machine_type
  worker_count      = var.worker_count
  resource_group_id = data.ibm_schematics_output.groups_output.output_values.resource_group_id
  kube_version      = var.kube_version
  cos_instance_crn  = ibm_resource_instance.rh_cos_instance.id
  entitlement       = "cloud_pak"

.*.id
  zones {
    subnet_id = element(data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids.*.id, 0)
    name      = "${var.ibm_region}-1"
  }
  zones {
    subnet_id = element(data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids.*.id, 1)
    name      = "${var.ibm_region}-2"
  }
  zones {
    subnet_id = element(data.ibm_schematics_output.vpc_workspace.output_values.subnet_ids.*.id, 2)
    name      = "${var.ibm_region}-3"
  }
}
