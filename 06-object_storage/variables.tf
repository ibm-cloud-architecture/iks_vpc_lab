##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
  default = "us-south"
  description = "IBM Cloud region where all resources will be deployed"
}

variable unique_id {
  description = "The unique id used to name resources"
}


##############################################################################
# Groups workspace id
##############################################################################

variable groups_ws_id {
  description = "01-groups workspace id"
}

#############################################################################
# KEY workspace id
##############################################################################

variable key_ws_id {
  description = "05-key_protect workspace id"
}

##############################################################################
# COS Variables
##############################################################################

variable cos_plan {
  description = "ibm cloud object storage plan"
  default     = "standard"
}

##############################################################################
# Resource Service Endpoints
##############################################################################
variable end_points {
  description = "Sets whether the end point for resource instances are public or private"
  default     = "public"
}

##############################################################################


##############################################################################
# Access Group Variables
##############################################################################
variable labadmin_access {
  description = "Access for the lab admin"
  default     = "Reader, Manager"
    
}

variable labuser_access {
  description = "Access for the lab participant"
  default      = "Reader, Viewer"
}

###############################################################################
