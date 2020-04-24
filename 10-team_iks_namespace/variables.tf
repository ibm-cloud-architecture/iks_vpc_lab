##############################################################################
# Account variables
##############################################################################

variable ibm_region {
  default = "us-south"
  description = "IBM Cloud region"
}
##############################################################################


##############################################################################
# Namespace variables
##############################################################################

variable namespace {
  description = "Configures new namespace"
  default     = "team-namespace"
}

#############################################################################


##############################################################################
# Groups workspace id
##############################################################################
variable groups_ws_id {
  description = "01-groups workspace id"
}

##############################################################################
# IKS workspace id
##############################################################################
variable iks_ws_id {
  description = "03-iks_cluster workspace id"
}

##############################################################################
# COS workspace id
##############################################################################
variable cos_ws_id {
  description = "06-object_storage workspace id"
}

##############################################################################
# DB workspace id
##############################################################################
variable db_ws_id {
  description = "08-team_database workspace id"
}



##############################################################################
# Block storage pvc variables
##############################################################################


variable pvc_name {
  description = "name of the IKS persistent volume claim using block storage"
  default = "iks-block-pvc"
  }


variable storage_class {
  description = "storage class for iks pvc"
  default     = "ibmc-vpc-block-10iops-tier"
}


variable volume_size {
  description = "volume size for the PVC block storage pvc"
  default     = "10Gi"
}


#############################################################################
