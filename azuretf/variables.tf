variable "project_code" {
  type    = string
  default = "dtmasterdoug"
}

variable "location" {
  type    = string
  default = "Brazil South"
}

variable "location_code" {
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
    projectCode = "dtmasterdoug"
    application = "data-master"
    costCenter  = "doug"
  }
}
