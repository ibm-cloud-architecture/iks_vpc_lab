##############################################################################
# Account Variables
##############################################################################

variable ibm_region {
  default = "us-south"
  description = "IBM Cloud region where all resources will be deployed"
}

variable unique_id {
  default = "kms"
  description = "A unique id to use in naming conventions for resources"
}

variable "resource_group_name" {
  description = "IBM Cloud Resource Group Name"
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
