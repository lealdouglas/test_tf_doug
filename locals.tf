// use locals for customizing vars
locals {
  suffix_main   = "${var.project_code}-${terraform.workspace}"
  suffix_concat = "${var.project_code}${terraform.workspace}"
  tags          = merge(var.tags, { "env" = terraform.workspace })
}
