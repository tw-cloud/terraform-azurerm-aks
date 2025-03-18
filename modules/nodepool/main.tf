resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  kubernetes_cluster_id = var.kubernetes_cluster_id
  name                  = var.node_pool_name
  auto_scaling_enabled  = var.auto_scaling_enabled
  node_count            = var.node_count
  min_count             = var.min_count
  max_count             = var.max_count
  max_pods              = var.max_pods
  vm_size               = var.vm_size
  node_labels           = var.node_labels
  node_taints           = var.node_taints
  pod_subnet_id         = var.pod_subnet_id
  vnet_subnet_id        = var.vnet_subnet_id
  tags                  = local.tags
}
