#*****************************************************************************
#  Terraform Documentation Block References
#   IBM Resource Key:  https://cloud.ibm.com/docs/terraform?topic=terraform-resource-management-data-sources&-access-data-sources#resource-key
#   Kubernetes:        https://www.terraform.io/docs/providers/kubernetes/index.html
#*****************************************************************************



##############################################################################
# Create LogDNA Agent Key
##############################################################################

resource kubernetes_secret logdna_agent_key {
  metadata {
    name = "logdna-agent-key",
    namespace = "${var.log_mon_ns}"
  }

  data = {
    logdna-agent-key = "${ibm_resource_key.logdna_secret.credentials["ingestion_key"]}"
  }

  type = "Opaque"

  depends_on = ["kubernetes_namespace.ibm_observe"]
}

##############################################################################


##############################################################################
# Create LogDNA Daemonset
##############################################################################

resource kubernetes_daemonset logdna_agent {
  metadata {
    name = "logdna-agent"
    namespace = "${var.log_mon_ns}"
  }

  spec {

    selector {
      match_labels = {
        app = "logdna-agent"
      }
    }

    template {
      metadata {
        labels = {
          app = "logdna-agent"
        }
      }

      spec {
        volume {
          name = "varlog"

          host_path {
            path = "/var/log"
          }
        }

        volume {
          name = "vardata"

          host_path {
            path = "/var/data"
          }
        }

        volume {
          name = "varlibdockercontainers"

          host_path {
            path = "/var/lib/docker/containers"
          }
        }

        volume {
          name = "mnt"

          host_path {
            path = "/mnt"
          }
        }

        volume {
          name = "docker"

          host_path {
            path = "/var/run/docker.sock"
          }
        }

        volume {
          name = "osrelease"

          host_path {
            path = "/etc/os-release"
          }
        }

        volume {
          name = "logdnahostname"

          host_path {
            path = "/etc/hostname"
          }
        }

        container {
          name  = "logdna-agent"
          image = "logdna/logdna-agent:latest"

          env {
            name = "LOGDNA_AGENT_KEY"

            value_from {
              secret_key_ref {
                name = "logdna-agent-key"
                key  = "logdna-agent-key"
              }
            }
          }

          env {
            name  = "LDAPIHOST"
            value = "api.private.${var.ibm_region}.logging.cloud.ibm.com"
          }

          env {
            name  = "LDLOGHOST"
            value = "logs.private.${var.ibm_region}.logging.cloud.ibm.com"
          }

          env {
            name  = "LOGDNA_PLATFORM"
            value = "k8s"
          }

          resources {
            limits {
              memory = "500Mi"
            }

            requests {
              cpu = "20m"
            }
          }

          volume_mount {
            name       = "varlog"
            mount_path = "/var/log"
          }

          volume_mount {
            name       = "vardata"
            mount_path = "/var/data"
          }

          volume_mount {
            name       = "varlibdockercontainers"
            read_only  = true
            mount_path = "/var/lib/docker/containers"
          }

          volume_mount {
            name       = "mnt"
            read_only  = true
            mount_path = "/mnt"
          }

          volume_mount {
            name       = "docker"
            mount_path = "/var/run/docker.sock"
          }

          volume_mount {
            name       = "osrelease"
            mount_path = "/etc/os-release"
          }

          volume_mount {
            name       = "logdnahostname"
            mount_path = "/etc/logdna-hostname"
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
  depends_on = ["kubernetes_secret.logdna_agent_key"]
}

##############################################################################
