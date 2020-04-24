##############################################################################
# Account Variables
# These values are provided when 01-groups workspace is created and run
##############################################################################

variable ibm_region {
    default = "us-south"
    description = "IBM Cloud region where all resources will be deployed"
}

variable resource_group {
    description = "The name of the resource group"
}


##############################################################################
# A Unique string used to differentiate cloud resources running in a multi-
# tenant cloud
##############################################################################

variable unique_id {
    description = "The unique identifier to distinuish the names of resources"
}
##############################################################################
