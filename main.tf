resource "azurerm_kubernetes_cluster" "aks" {
  resource_group_name = var.resource_group_name
  location            = var.location

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  dns_prefix_private_cluster = local.dns_prefix_private_cluster
  dns_prefix                 = local.dns_prefix

  private_cluster_enabled             = var.private_cluster_enabled
  private_dns_zone_id                 = local.private_dns_zone_id
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled

  oidc_issuer_enabled       = var.workload_identity_enabled
  workload_identity_enabled = var.workload_identity_enabled

  dynamic "service_mesh_profile" {
    for_each = var.service_mesh_profile != null ? ["service_mesh_profile"] : []
    content {
      mode                             = var.service_mesh_profile.mode
      revisions                        = var.service_mesh_profile.revisions
      external_ingress_gateway_enabled = var.service_mesh_profile.external_ingress_gateway_enabled
      internal_ingress_gateway_enabled = var.service_mesh_profile.internal_ingress_gateway_enabled

      dynamic "certificate_authority" {
        for_each = var.service_mesh_profile.certificate_authority != null ? ["ca"] : []
        content {
          key_vault_id           = var.service_mesh_profile.certificate_authority.key_vault_id
          root_cert_object_name  = var.service_mesh_profile.certificate_authority.root_cert_object_name
          cert_chain_object_name = var.service_mesh_profile.certificate_authority.cert_chain_object_name
          cert_object_name       = var.service_mesh_profile.certificate_authority.cert_object_name
          key_object_name        = var.service_mesh_profile.certificate_authority.key_object_name
        }
      }
    }
  }

  dynamic "oms_agent" {
    for_each = var.oms_agent != null ? [var.oms_agent] : []
    content {
      log_analytics_workspace_id      = var.oms_agent.log_analytics_workspace_id
      msi_auth_for_monitoring_enabled = var.oms_agent.msi_auth_for_monitoring_enabled
    }
  }

  dynamic "identity" {
    for_each = [var.identity]

    content {
      type         = var.identity.type
      identity_ids = var.identity.identity_ids
    }
  }

  dynamic "key_vault_secrets_provider" {
    for_each = [var.key_vault_secrets_provider]
    content {
      secret_rotation_enabled  = var.key_vault_secrets_provider.secret_rotation_enabled
      secret_rotation_interval = var.key_vault_secrets_provider.secret_rotation_interval
    }
  }

  default_node_pool {
    name                 = var.default_node_pool_name
    vnet_subnet_id       = var.private_subnet_id
    pod_subnet_id        = var.default_node_pool_pod_subnet_id
    max_pods             = var.default_node_pool_max_pods
    min_count            = var.default_node_pool_min_count
    max_count            = var.default_node_pool_max_count
    node_count           = var.default_node_pool_node_count
    auto_scaling_enabled = var.default_node_pool_auto_scaling_enabled
    vm_size              = var.default_node_pool_vm_size
    tags                 = merge(local.tags, var.default_node_pool_tags)
  }

  dynamic "network_profile" {
    for_each = var.network_profile != null ? [var.network_profile] : []
    content {
      network_plugin      = var.network_profile.network_plugin
      network_mode        = var.network_profile.network_mode
      network_policy      = var.network_profile.network_policy
      dns_service_ip      = var.network_profile.dns_service_ip
      network_data_plane  = var.network_profile.network_data_plane
      network_plugin_mode = var.network_profile.network_plugin_mode
      outbound_type       = var.network_profile.outbound_type
      pod_cidrs           = var.network_profile.pod_cidrs
      service_cidr        = var.network_profile.service_cidr
    }
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].upgrade_settings,
      network_profile[0],
      kubelet_identity[0],
    ]
  }
}

module "node_pool" {
  source = "./modules/nodepool"

  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id

  for_each = var.node_pools

  node_pool_name       = each.key
  auto_scaling_enabled = each.value.auto_scaling_enabled
  node_count           = each.value.node_count
  min_count            = each.value.min_count
  max_count            = each.value.max_count
  max_pods             = each.value.max_pods
  vm_size              = each.value.vm_size
  node_labels          = each.value.node_labels
  node_taints          = each.value.node_taints
  pod_subnet_id        = each.value.pod_subnet_id
  vnet_subnet_id       = each.value.vnet_subnet_id
  tags                 = each.value.tags
}