variable "project_code" {
  type    = string
  default = "datamasterdoug"
}

variable "region" {
  type    = string
  default = "Brazil South"
}

variable "region_code" {
  type    = string
  default = "br"
}

variable "envv" {
  type    = string
  default = "dev"
}

variable "tags" {
  type = map(any)
  default = {
    projectCode = "datamasterdoug"
    application = "data-master"
    costCenter  = "doug"
  }
}
