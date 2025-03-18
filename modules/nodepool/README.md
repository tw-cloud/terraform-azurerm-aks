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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster_node_pool.nodepool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scaling_enabled"></a> [auto\_scaling\_enabled](#input\_auto\_scaling\_enabled) | Is Auto Scaling enabled for the Kubernetes Cluster Node Pool? | `bool` | `false` | no |
| <a name="input_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#input\_kubernetes\_cluster\_id) | The ID of the Kubernetes Cluster. | `string` | n/a | yes |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | The maximum number of nodes for the Kubernetes Cluster Node Pool. | `number` | `null` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | The maximum number of pods that can run on a node in the Kubernetes Cluster Node Pool. | `number` | `110` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | The minimum number of nodes for the Kubernetes Cluster Node Pool. | `number` | `null` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The initial number of nodes for the Kubernetes Cluster Node Pool. | `number` | `null` | no |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | A map of Kubernetes labels that are applied to each node in the Kubernetes Cluster Node Pool. | `map(string)` | `{}` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | The name of the Kubernetes Cluster Node Pool. | `string` | n/a | yes |
| <a name="input_node_taints"></a> [node\_taints](#input\_node\_taints) | A list of Kubernetes taints that are applied to each node in the Kubernetes Cluster Node Pool. | `list(string)` | `[]` | no |
| <a name="input_pod_subnet_id"></a> [pod\_subnet\_id](#input\_pod\_subnet\_id) | The ID of the Subnet where the Pods will be deployed. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the Virtual Machine for the Kubernetes Cluster Node Pool. | `string` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The ID of the Subnet where the Virtual Machines will be deployed. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the Kubernetes Cluster. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Kubernetes Node Pool. |
| <a name="output_max_count"></a> [max\_count](#output\_max\_count) | The maximum number of nodes in the Kubernetes Node Pool. |
| <a name="output_max_pods"></a> [max\_pods](#output\_max\_pods) | The maximum number of pods that can run on a node in the Kubernetes Node Pool. |
| <a name="output_min_count"></a> [min\_count](#output\_min\_count) | The minimum number of nodes in the Kubernetes Node Pool. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Kubernetes Node Pool. |
| <a name="output_node_count"></a> [node\_count](#output\_node\_count) | The number of nodes in the Kubernetes Node Pool. |
| <a name="output_node_labels"></a> [node\_labels](#output\_node\_labels) | The labels for the Kubernetes Node Pool. |
| <a name="output_node_taints"></a> [node\_taints](#output\_node\_taints) | The taints for the Kubernetes Node Pool. |
| <a name="output_pod_subnet_id"></a> [pod\_subnet\_id](#output\_pod\_subnet\_id) | The ID of the subnet to use for pods in the Kubernetes Node Pool. |
| <a name="output_vm_size"></a> [vm\_size](#output\_vm\_size) | The size of the Virtual Machine for the Kubernetes Node Pool. |
| <a name="output_vnet_subnet_id"></a> [vnet\_subnet\_id](#output\_vnet\_subnet\_id) | The ID of the subnet to use for the Kubernetes Node Pool. |
