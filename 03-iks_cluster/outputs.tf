##############################################################################
# Kube Cert Outputs
##############################################################################

output "host" {
  value       = "${data.ibm_container_cluster_config.cluster.host}"
  description = "IKS Host URL"
  sensitive   = true
}

output "client_certificate" {
  value       = "${data.ibm_container_cluster_config.cluster.admin_certificate}"
  description = "IKS Client certificate"
  sensitive   = true
}

output "client_key" {
  value       = "${data.ibm_container_cluster_config.cluster.admin_key}"
  description = "IKS client key certificate"
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = "${data.ibm_container_cluster_config.cluster.ca_certificate}"
  description = "IKS Client CA certificate"
  sensitive   = true
}


##############################################################################

##############################################################################
# Kube CONFIG Outputs
##############################################################################

output "cluster_id" {
  value       = "${ibm_container_vpc_cluster.cluster.id}"
  description = "IKS on VPC cluster ID"
}

output "config_path" {
  value       = "${data.ibm_container_cluster_config.cluster.config_file_path}"
  description = "Path to kubernetes config yaml file"
  sensitive   = true
}

output "cluster_name" {
  value       = "${ibm_container_vpc_cluster.cluster.name}"
  description = "IKS Cluster name, can be used to await cluster provision to create resources"
}

##############################################################################

##############################################################################
# Ingress outputs
##############################################################################

output "ingress_hostname" {
  value       = "${ibm_container_vpc_cluster.cluster.ingress_hostname}"
  description = "ingress subdomain host name of cluster"
}

output "ingress_secret" {
  value       = "${ibm_container_vpc_cluster.cluster.ingress_secret}"
  description = "name of ingress subdomain secret"
}

