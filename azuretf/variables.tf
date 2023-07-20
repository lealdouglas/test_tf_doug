variable "project_code" {
  type    = string
  default = "dougtf"
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
    projectCode = "doug-tf"
    application = "data-plataform"
    costCenter  = "doug"
  }
}
