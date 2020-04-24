##############################################################################
# Account Variables
##############################################################################

variable "ibm_region" {
  default     = "us-south"
  description = "IBM Cloud region where all resources will be deployed"
}

##############################################################################
# Cluster Variables
##############################################################################
variable "cluster_name" {
  description = "name for the iks cluster"
}

variable "machine_type" {
  description = "Machine type for the IKS Cluster"
  default     = "bx2.4x16"
}

variable "worker_count" {
  description = "Number of workers per zone"
  default     = 1
}

##############################################################################

##############################################################################
# VPC workspace ID
##############################################################################
variable "vpc_ws_id" {
  description = "02-vpc workspace id"
}

##############################################################################
# Groups workspace ID
##############################################################################
variable "groups_ws_id" {
  description = "01-groups workspace id"
}

##############################################################################
# Access Group Variables
##############################################################################

variable "labadmin_access" {
  description = "Access policy for lab admin"
  default     = "Reader, Manager"
  
  }

variable "labuser_access" {
  description = "Access policy for lab participant"
  default     = "Reader, Viewer"
}

##############################################################################
