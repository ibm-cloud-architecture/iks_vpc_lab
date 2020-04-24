####################################################################################################
# 10-team_iks_namespace  Creates key protect key
#
# Depends on:
#    schematics.tf - provides the output data from the 01-groups, 03-iks_cluster, 06-object_storage 
#                    and 08-team_database Schematics workspaces
#
# Requires:
#   See provider.tf
#       variables.tf
#
# Creates: 
#   - Creates a namespace in the kubernetes cluster (kubernetes_namespace.new_namespace)
#   - In binding.tf, binds the database and the cloud object storage to the kubernetes namespace
#
# Outputs: 
#  see outputs.tf
#
# References:
#   Kube Namespace: https://www.terraform.io/docs/providers/kubernetes/r/namespace.html
#   Kube Network:   https://www.terraform.io/docs/providers/kubernetes/r/network_policy.html
#####################################################################################################

##############################################################################
# Creates a namespace 
##############################################################################

resource kubernetes_namespace team_namespace {

  metadata {
    annotations = {
      name = "${var.namespace}"
    }

    labels = {
      mylabel = "${var.namespace}"
    }

    name = "${var.namespace}"

  }

}

##############################################################################


##############################################################################
# Denies traffic to namespaces with network policy
##############################################################################

resource kubernetes_network_policy deny_traffic_namespace {
  metadata {
    namespace = "${var.namespace}"
    name      = "${var.namespace}"
  }

  spec {
    pod_selector {

    }
    ingress {

    }
    policy_types = ["Ingress"]
  }


  depends_on = ["kubernetes_namespace.team_namespace"]

}

##############################################################################
