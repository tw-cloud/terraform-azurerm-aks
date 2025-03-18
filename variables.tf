variable "resource_group_name" {
  description = "The name of the resource group in which the Kubernetes Cluster will be created."
  type        = string
}

variable "location" {
  description = "The location/region where the Kubernetes Cluster will be created."
  type        = string
}

variable "cluster_name" {
  description = "The name of the Kubernetes Cluster."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix to use with the Kubernetes Cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the Kubernetes Cluster."
  type        = string
}

variable "private_cluster_enabled" {
  description = "Should the Kubernetes Cluster be private?"
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "The ID of the Private DNS Zone to use with the Kubernetes Cluster."
  type        = string
  nullable    = true
  default     = null
}

variable "private_cluster_public_fqdn_enabled" {
  description = "Should the private cluster have a public FQDN?"
  type        = bool
  default     = null
  nullable    = true
}

variable "private_subnet_id" {
  description = "The ID of the subnet to use for the private cluster."
  type        = string
  nullable    = true
  default     = null
}

variable "workload_identity_enabled" {
  description = "Should workload identity be enabled for the Kubernetes Cluster?"
  type        = bool
  default     = true
}

variable "oms_agent" {
  type = object({
    log_analytics_workspace_id      = string
    msi_auth_for_monitoring_enabled = optional(bool, null)
  })
  description = "The OMS agent configuration for the Kubernetes Cluster."
  default     = null
  nullable    = true
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string), [])
  })
  description = "The identity configuration for the Kubernetes Cluster."
  default = {
    type         = "SystemAssigned"
    identity_ids = []
  }
  nullable = false
}

variable "key_vault_secrets_provider" {
  type = object({
    secret_rotation_enabled  = bool
    secret_rotation_interval = optional(string, null)
  })
  description = "The Key Vault secrets provider configuration for the Kubernetes Cluster."
  default = {
    secret_rotation_enabled  = true
    secret_rotation_interval = null
  }
  nullable = false
}

variable "default_node_pool_name" {
  description = "The name of the default node pool."
  type        = string
  default     = "system"
}

variable "default_node_pool_pod_subnet_id" {
  description = "The ID of the subnet to use for pods in the default node pool."
  type        = string
  nullable    = true
  default     = null
}

variable "default_node_pool_max_pods" {
  description = "The maximum number of pods that can run on a node in the default node pool."
  type        = number
  default     = 110
}

variable "default_node_pool_auto_scaling_enabled" {
  description = "Should auto-scaling be enabled for the default node pool?"
  type        = bool
  default     = true
}

variable "default_node_pool_min_count" {
  description = "The minimum number of nodes in the default node pool."
  type        = number
  default     = null
  nullable    = true

}

variable "default_node_pool_max_count" {
  description = "The maximum number of nodes in the default node pool."
  type        = number
  default     = null
  nullable    = true
}

variable "default_node_pool_node_count" {
  description = "The initial number of nodes in the default node pool."
  type        = number
  default     = null
  nullable    = true
}

variable "default_node_pool_vm_size" {
  description = "The size of the VMs in the default node pool."
  type        = string
  default     = "Standard_DS2_v2"
}

variable "default_node_pool_tags" {
  description = "A map of tags to apply to the default node pool."
  type        = map(string)
  default     = {}
}

variable "network_profile" {
  type = object({
    network_plugin      = optional(string, "azure")
    network_mode        = optional(string, null)
    network_policy      = optional(string, null)
    dns_service_ip      = optional(string, null)
    network_data_plane  = optional(string, null)
    network_plugin_mode = optional(string, null)
    outbound_type       = optional(string, null)
    pod_cidrs           = optional(list(string), [])
    service_cidr        = optional(string, null)
  })
  description = "The network profile configuration for the Kubernetes Cluster."
  default     = null
}

variable "service_mesh_profile" {
  type = object({
    mode                             = string
    revisions                        = optional(list(string), ["asm-1-24"])
    external_ingress_gateway_enabled = optional(bool, true)
    internal_ingress_gateway_enabled = optional(bool, true)
    certificate_authority = optional(object({
      key_vault_id           = string
      root_cert_object_name  = string
      cert_chain_object_name = string
      cert_object_name       = string
      key_object_name        = string
    }), null)
  })
  description = "The service mesh profile configuration for the Kubernetes Cluster."
  default     = null
  nullable    = true
}

variable "node_pools" {
  description = "A list of node pools to create in the Kubernetes Cluster."
  type = map(object({
    auto_scaling_enabled = optional(bool, false)
    node_count           = optional(number, null)
    min_count            = optional(number, null)
    max_count            = optional(number, null)
    max_pods             = optional(number, 110)
    vm_size              = string
    node_labels          = optional(map(string), {})
    node_taints          = optional(list(string), [])
    pod_subnet_id        = optional(string, null)
    vnet_subnet_id       = optional(string, null)
    tags                 = optional(map(string), {})
  }))
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
