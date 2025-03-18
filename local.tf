locals {
  module_tags = {
    "tf-module" = abspath(path.module)
  }
  tags = merge(
    var.tags,
    local.module_tags
  )

  dns_prefix_private_cluster = var.private_cluster_enabled ? var.dns_prefix : null
  dns_prefix                 = var.private_cluster_enabled ? null : var.dns_prefix
  private_dns_zone_id        = var.private_cluster_enabled ? var.private_dns_zone_id : null
}