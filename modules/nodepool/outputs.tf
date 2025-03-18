output "id" {
  description = "The ID of the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.id
}

output "cluster_id" {
  description = "The ID of the Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.kubernetes_cluster_id
}

output "name" {
  description = "The name of the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.name
}

output "node_count" {
  description = "The number of nodes in the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.node_count
}

output "min_count" {
  description = "The minimum number of nodes in the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.min_count
}

output "max_count" {
  description = "The maximum number of nodes in the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.max_count
}

output "max_pods" {
  description = "The maximum number of pods that can run on a node in the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.max_pods
}

output "vm_size" {
  description = "The size of the Virtual Machine for the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.vm_size
}

output "node_labels" {
  description = "The labels for the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.node_labels
}

output "node_taints" {
  description = "The taints for the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.node_taints
}

output "pod_subnet_id" {
  description = "The ID of the subnet to use for pods in the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.pod_subnet_id
}

output "vnet_subnet_id" {
  description = "The ID of the subnet to use for the Kubernetes Node Pool."
  value       = azurerm_kubernetes_cluster_node_pool.nodepool.vnet_subnet_id
}