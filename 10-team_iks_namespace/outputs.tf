output complete {
  value      = "true"
  depends_on = ["kubernetes_network_policy.deny_traffic_namespace"]
}