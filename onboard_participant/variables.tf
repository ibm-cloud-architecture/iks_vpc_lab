##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
    default = "us-south"
    description = "IBM Cloud region where all resources will be deployed"
}

##############################################################################
# Unique ID variable to distinguish from other resources
##############################################################################
variable unique_id {
    default = "lab4369"
    description = "The unique name for this lab - only use letters/numbers"
}

##############################################################################
# Resource group name variable
##############################################################################
variable resource_group_name {
    description = "The unique name for this lab participant "
#   Only use these  \"^[a-zA-Z0-9-_ ]+$\"","more_info":"n/a"}]} 
}

##############################################################################
# Lab Participant IBMid variable
##############################################################################
variable labuser_id {
    default = "labusers@ibm.com"
    description = "The IBMid of the lab participant"
}

##############################################################################
# Groups workspace ID
##############################################################################

variable groups_ws_id {
    description = "01-Groups workspace id"
}

