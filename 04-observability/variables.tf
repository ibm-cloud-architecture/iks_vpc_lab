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
# Resource Service Endpoints
##############################################################################
variable end_points {
  description = "Sets whether the end point for resource instances are public or private"
  default     = "public"
}

##############################################################################

##############################################################################
# IKS or OCP workspace id
##############################################################################

variable iks_ws_id {
  description = "03-iks_cluster  or  03-ocp_cluster workspace id"
}

##############################################################################
# Group workspace ID
##############################################################################
variable groups_ws_id {
  description = "01-groups workspace id"
}

##############################################################################
# Logging and Monitoring Variables
##############################################################################

variable log_mon_ns {
  description = "the namespace where logging and monitoring daemonsets are deployed"
  default = "ibm-observe"
  }


variable log_role {
  description = "logdna role"
  default     = "Manager"
}


variable logging_plan {
  description = "service plan for LogDNA, Activity Tracker."
  default     = "7-day"
}

variable monitor_plan {
  description = "service plan for Monitoring"
  default     = "graduated-tier"
}

variable activity_tracker {
  description = "boolean to provision activity tracker"
  default     = false
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
