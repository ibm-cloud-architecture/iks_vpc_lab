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


##############################################################################
# IKS workspace id
##############################################################################

variable iks_ws_id {
  description = "03-iks_cluster workspace id"

}

##############################################################################
# CMS Variables
##############################################################################

variable cms_plan {
  default = "free"
  description = "service plan for Monitoring"
}

variable key {
  description ="Private key"
  default = "private_key.key"
}
variable cert {
  description = "certificate"
  default = "certificate.pem"
}

##############################################################################
# Resource Service Endpoints
##############################################################################
variable end_points {
  default = "public"
  description = "Sets whether the end point for resource instances are public or private"
}

##############################################################################
# Access Group Variables
##############################################################################

variable labadmin_access {
  description = "Access policy for lab admin"
  default  = "Reader, Manager"
}

variable labuser_access {
  description = "Access policy for lab participant"
  default      = "Reader, Viewer" 
}

##############################################################################
