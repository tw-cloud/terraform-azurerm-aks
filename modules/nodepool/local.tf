locals {
  module_tags = {
    "tf-module" = abspath(path.module)
  }
  tags = merge(
    var.tags,
    local.module_tags
  )
}