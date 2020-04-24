##############################################################################
# Create PVC using Block storage for the IKS cluster.
# Block Storage for VPC supports a ReadWriteOnce access mode only
# You can mount the PVC to one pod on one worker node in the cluster at a time.
##############################################################################


resource kubernetes_persistent_volume_claim iks_pvc {
  metadata {
    name = "${var.pvc_name}"
  }
  spec {
    access_modes = [     
        "ReadWriteOnce"   
    ] 
    resources {
      requests = {
        storage = "${var.volume_size}"
      }
    }
    storage_class_name = "${var.storage_class}"
  }
}

##############################################################################
