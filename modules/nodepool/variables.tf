variable "kubernetes_cluster_id" {
  description = "The ID of the Kubernetes Cluster."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the Kubernetes Cluster Node Pool."
  type        = string
}

variable "auto_scaling_enabled" {
  description = "Is Auto Scaling enabled for the Kubernetes Cluster Node Pool?"
  type        = bool
  default     = false
}

variable "node_count" {
  description = "The initial number of nodes for the Kubernetes Cluster Node Pool."
  type        = number
  default     = null
  nullable    = true
}

variable "min_count" {
  description = "The minimum number of nodes for the Kubernetes Cluster Node Pool."
  type        = number
  default     = null
  nullable    = true
}

variable "max_count" {
  description = "The maximum number of nodes for the Kubernetes Cluster Node Pool."
  type        = number
  default     = null
  nullable    = true
}

variable "max_pods" {
  description = "The maximum number of pods that can run on a node in the Kubernetes Cluster Node Pool."
  type        = number
  default     = 110
}

variable "vm_size" {
  description = "The size of the Virtual Machine for the Kubernetes Cluster Node Pool."
  type        = string
}

variable "node_labels" {
  description = "A map of Kubernetes labels that are applied to each node in the Kubernetes Cluster Node Pool."
  type        = map(string)
  default     = {}
}

variable "node_taints" {
  description = "A list of Kubernetes taints that are applied to each node in the Kubernetes Cluster Node Pool."
  type        = list(string)
  default     = []
}

variable "pod_subnet_id" {
  description = "The ID of the Subnet where the Pods will be deployed."
  type        = string
  default     = null
  nullable    = true
}

variable "vnet_subnet_id" {
  description = "The ID of the Subnet where the Virtual Machines will be deployed."
  type        = string
  default     = null
  nullable    = true
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
