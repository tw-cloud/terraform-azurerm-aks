output "id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the Kubernetes Cluster."
}

output "name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The name of the Kubernetes Cluster."
}

output "kubernetes_version" {
  value       = azurerm_kubernetes_cluster.aks.kubernetes_version
  description = "The version of Kubernetes in use."
}

output "private_cluster_enabled" {
  value       = azurerm_kubernetes_cluster.aks.private_cluster_enabled
  description = "Is the Kubernetes Cluster private?"
}

output "fqdn" {
  value       = azurerm_kubernetes_cluster.aks.fqdn != null ? azurerm_kubernetes_cluster.aks.fqdn : "NA"
  description = "The FQDN of the Kubernetes Cluster."
}

output "private_fqdn" {
  value       = azurerm_kubernetes_cluster.aks.private_fqdn != null ? azurerm_kubernetes_cluster.aks.private_fqdn : "NA"
  description = "The private FQDN of the Kubernetes Cluster."
}

output "oms_agent_identity_id" {
  value       = azurerm_kubernetes_cluster.aks.oms_agent[0].oms_agent_identity[0].object_id
  description = "The ID of the Managed Identity used by the OMS agent."
}

output "kubelet_identity_id" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  description = "The ID of the Managed Identity used by the kubelet."
}

output "aks_issuer_url" {
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  description = "The issuer URL for the AKS cluster."
}

output "node_pools" {
  description = "The Kubernetes Node Pools."

  value = {
    for node_pool in module.node_pool :
    node_pool.node_pool_name => node_pool
  }
}