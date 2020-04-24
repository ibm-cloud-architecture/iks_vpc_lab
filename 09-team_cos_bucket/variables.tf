##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
  default = "us-south"
  description = "IBM Cloud region where all resources will be deployed"
}

##############################################################################
# Groups Workspace ID
##############################################################################

variable groups_ws_id {
  description = "01-groups workspace id"
}

##############################################################################
# IKS Workspace ID
##############################################################################

variable iks_ws_id {
  description = "03-iks_cluster workspace id"
}

##############################################################################
# KEY Workspace ID
##############################################################################

variable key_ws_id {
  description = "05-key_protect workspace id"
}

##############################################################################
# COS Workspace ID
##############################################################################

variable cos_ws_id {
  description = "06-object_storage workspace id"
}

##############################################################################
# COS Variables
##############################################################################

variable cos_bucket_name {
  description = "the plan to use for provisioning key protect instance"
  default     = "iks-on-vpc-bucket"
}

variable cos_bucket_storage_class {
  description = "storage class for COS bucket to be created"
  default     = "standard"
}


##############################################################################
# Access Group Variables
##############################################################################

variable labadmin_access {
  description = "Access policies for Lab admin"
  default  = "Reader, Manager"
    
}

variable labuser_access {
  description = "Access policies for lab participant"
  default  = "Reader, Viewer"
    
}

##############################################################################
