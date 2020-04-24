
##############################################################################
# COS Bucket Outputs
##############################################################################

output cos_bucket_name {
  value      = "${var.cos_bucket_name}"
  depends_on = ["ibm_cos_bucket.cos_bucket.id"]
}
