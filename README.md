## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.23.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_node_pool"></a> [node\_pool](#module\_node\_pool) | ./modules/nodepool | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_default_node_pool_auto_scaling_enabled"></a> [default\_node\_pool\_auto\_scaling\_enabled](#input\_default\_node\_pool\_auto\_scaling\_enabled) | Should auto-scaling be enabled for the default node pool? | `bool` | `true` | no |
| <a name="input_default_node_pool_max_count"></a> [default\_node\_pool\_max\_count](#input\_default\_node\_pool\_max\_count) | The maximum number of nodes in the default node pool. | `number` | `null` | no |
| <a name="input_default_node_pool_max_pods"></a> [default\_node\_pool\_max\_pods](#input\_default\_node\_pool\_max\_pods) | The maximum number of pods that can run on a node in the default node pool. | `number` | `110` | no |
| <a name="input_default_node_pool_min_count"></a> [default\_node\_pool\_min\_count](#input\_default\_node\_pool\_min\_count) | The minimum number of nodes in the default node pool. | `number` | `null` | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | The name of the default node pool. | `string` | `"system"` | no |
| <a name="input_default_node_pool_node_count"></a> [default\_node\_pool\_node\_count](#input\_default\_node\_pool\_node\_count) | The initial number of nodes in the default node pool. | `number` | `null` | no |
| <a name="input_default_node_pool_pod_subnet_id"></a> [default\_node\_pool\_pod\_subnet\_id](#input\_default\_node\_pool\_pod\_subnet\_id) | The ID of the subnet to use for pods in the default node pool. | `string` | `null` | no |
| <a name="input_default_node_pool_tags"></a> [default\_node\_pool\_tags](#input\_default\_node\_pool\_tags) | A map of tags to apply to the default node pool. | `map(string)` | `{}` | no |
| <a name="input_default_node_pool_vm_size"></a> [default\_node\_pool\_vm\_size](#input\_default\_node\_pool\_vm\_size) | The size of the VMs in the default node pool. | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The DNS prefix to use with the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_identity"></a> [identity](#input\_identity) | The identity configuration for the Kubernetes Cluster. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string), [])<br/>  })</pre> | <pre>{<br/>  "identity_ids": [],<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_key_vault_secrets_provider"></a> [key\_vault\_secrets\_provider](#input\_key\_vault\_secrets\_provider) | The Key Vault secrets provider configuration for the Kubernetes Cluster. | <pre>object({<br/>    secret_rotation_enabled  = bool<br/>    secret_rotation_interval = optional(string, null)<br/>  })</pre> | <pre>{<br/>  "secret_rotation_enabled": true,<br/>  "secret_rotation_interval": null<br/>}</pre> | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The version of Kubernetes to use for the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Kubernetes Cluster will be created. | `string` | n/a | yes |
| <a name="input_network_profile"></a> [network\_profile](#input\_network\_profile) | The network profile configuration for the Kubernetes Cluster. | <pre>object({<br/>    network_plugin      = optional(string, "azure")<br/>    network_mode        = optional(string, null)<br/>    network_policy      = optional(string, null)<br/>    dns_service_ip      = optional(string, null)<br/>    network_data_plane  = optional(string, null)<br/>    network_plugin_mode = optional(string, null)<br/>    outbound_type       = optional(string, null)<br/>    pod_cidrs           = optional(list(string), [])<br/>    service_cidr        = optional(string, null)<br/>  })</pre> | `null` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | A list of node pools to create in the Kubernetes Cluster. | <pre>map(object({<br/>    auto_scaling_enabled = optional(bool, false)<br/>    node_count           = optional(number, null)<br/>    min_count            = optional(number, null)<br/>    max_count            = optional(number, null)<br/>    max_pods             = optional(number, 110)<br/>    vm_size              = string<br/>    node_labels          = optional(map(string), {})<br/>    node_taints          = optional(list(string), [])<br/>    pod_subnet_id        = optional(string, null)<br/>    vnet_subnet_id       = optional(string, null)<br/>    tags                 = optional(map(string), {})<br/>  }))</pre> | n/a | yes |
| <a name="input_oms_agent"></a> [oms\_agent](#input\_oms\_agent) | The OMS agent configuration for the Kubernetes Cluster. | <pre>object({<br/>    log_analytics_workspace_id      = string<br/>    msi_auth_for_monitoring_enabled = optional(bool, null)<br/>  })</pre> | `null` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Should the Kubernetes Cluster be private? | `bool` | `false` | no |
| <a name="input_private_cluster_public_fqdn_enabled"></a> [private\_cluster\_public\_fqdn\_enabled](#input\_private\_cluster\_public\_fqdn\_enabled) | Should the private cluster have a public FQDN? | `bool` | `null` | no |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | The ID of the Private DNS Zone to use with the Kubernetes Cluster. | `string` | `null` | no |
| <a name="input_private_subnet_id"></a> [private\_subnet\_id](#input\_private\_subnet\_id) | The ID of the subnet to use for the private cluster. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Kubernetes Cluster will be created. | `string` | n/a | yes |
| <a name="input_service_mesh_profile"></a> [service\_mesh\_profile](#input\_service\_mesh\_profile) | The service mesh profile configuration for the Kubernetes Cluster. | <pre>object({<br/>    mode                             = string<br/>    revisions                        = optional(list(string), ["asm-1-24"])<br/>    external_ingress_gateway_enabled = optional(bool, true)<br/>    internal_ingress_gateway_enabled = optional(bool, true)<br/>    certificate_authority = optional(object({<br/>      key_vault_id           = string<br/>      root_cert_object_name  = string<br/>      cert_chain_object_name = string<br/>      cert_object_name       = string<br/>      key_object_name        = string<br/>    }), null)<br/>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_workload_identity_enabled"></a> [workload\_identity\_enabled](#input\_workload\_identity\_enabled) | Should workload identity be enabled for the Kubernetes Cluster? | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_issuer_url"></a> [aks\_issuer\_url](#output\_aks\_issuer\_url) | The issuer URL for the AKS cluster. |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the Kubernetes Cluster. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Kubernetes Cluster. |
| <a name="output_kubelet_identity_id"></a> [kubelet\_identity\_id](#output\_kubelet\_identity\_id) | The ID of the Managed Identity used by the kubelet. |
| <a name="output_kubernetes_version"></a> [kubernetes\_version](#output\_kubernetes\_version) | The version of Kubernetes in use. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Kubernetes Cluster. |
| <a name="output_node_pools"></a> [node\_pools](#output\_node\_pools) | The Kubernetes Node Pools. |
| <a name="output_oms_agent_identity_id"></a> [oms\_agent\_identity\_id](#output\_oms\_agent\_identity\_id) | The ID of the Managed Identity used by the OMS agent. |
| <a name="output_private_cluster_enabled"></a> [private\_cluster\_enabled](#output\_private\_cluster\_enabled) | Is the Kubernetes Cluster private? |
| <a name="output_private_fqdn"></a> [private\_fqdn](#output\_private\_fqdn) | The private FQDN of the Kubernetes Cluster. |
