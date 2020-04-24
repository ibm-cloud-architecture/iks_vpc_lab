##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
  default = "us-south"
  description = "IBM Cloud region where all resources will be deployed"
}

variable unique_id {
  description = "The unique id used for naming resources"
}

##############################################################################

##############################################################################
# Groups ws id
##############################################################################

variable groups_ws_id {
  description = "01-groups workspace id"
}

##############################################################################
# VPC ws ids
##############################################################################

variable vpc_ws_id {
  description = "02-vpc workspace id"
}

##############################################################################
# KEY ws id
##############################################################################

variable key_ws_id {
  description = "05-key_protect workspace id" 
}
##############################################################################


##############################################################################
# PostgresSQL Variables
##############################################################################
variable postgres_plan {
  description = "postgresSQL database plan"
  default     = "standard"
}

variable postgres_secret_name {
  description = "postgresSQL secret name"
  default     = "postgres_secret"
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
  description = "Access policy for lab admin"
  default     = "Reader, Manager"
    
}

variable labuser_access {
  description = "Access policy for lab participant"
  default      = "Reader, Viewer"
}


##############################################################################

##############################################################################
# Lab workspace ID
##############################################################################


##############################################################################
