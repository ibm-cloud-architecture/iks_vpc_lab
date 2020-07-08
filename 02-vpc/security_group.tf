#*****************************************************************************
# IBM Terraform Provider Documentation Block References
#   VPC Security Group Rule: https://cloud.ibm.com/docs/terraform?topic=terraform-vpc-gen2-resources&-access-data-sources#sec-group-rule
#*****************************************************************************

##############################################################################
# Create an inbound TCP Security Group rule for Ports 30000-32767 
# This is required for OCP Clusters
##############################################################################

resource "ibm_is_security_group_rule" "sg_rule_tcp_in_30000_32767" {
    group = "${ibm_is_vpc.vpc.default_security_group}"
    direction = "inbound"
    tcp {
        port_min = 30000
        port_max = 32767
    }
 }
