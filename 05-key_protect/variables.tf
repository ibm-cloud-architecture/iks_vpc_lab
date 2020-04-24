##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
  default = "us-south"
  description = "IBM Cloud region where all resources will be deployed"
}

variable unique_id {
  description = "A unique id to use in naming conventions for resources"
}


##############################################################################
# Groups workspace id
##############################################################################

variable groups_ws_id {
  description = "01-groups workspace id"
}

##############################################################################
# Key Protect Variables
##############################################################################

variable kms_plan {
  description = "the plan to use for provisioning key protect instance"
  default     = "tiered-pricing"
}

variable kms_root_key_name {
  description = "the root key name for the key protect instance"
  default     = "root_key"
}

##############################################################################
# Access Group Variables
##############################################################################

variable labadmin_access {
  description = "Access policy for the lab admin"
  default     = "Reader, Manager"
    
}

variable labuser_access {
  description = "Access policy for lab participant"
  default      = "Reader, Viewer"
    
}

##############################################################################
