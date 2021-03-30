variable "geozone" {
  type        = string
  description = "Azure region were resources are deployed"
  default     = "France Central"
}

variable "client" {
  type        = string
  description = "Code name of the client. Must have 3 alphanumeric chars."
  validation {
    condition     = length(var.client) == 3
    error_message = "Must be a 3 alphanumeric code."
  }
}

variable "budget" {
  type        = string
  description = "Code name of the budget. Must have 6 alphanumeric chars."
  validation {
    condition     = length(var.budget) == 6
    error_message = "Must contains 6 alphanumeric chars."
  }
}

variable "project" {
  type        = string
  description = "Code name of the subproject. Must have 4 digits."
  validation {
    condition     = length(var.project) == 4
    error_message = "Must be a 4 dights code."
  }
}

variable "custom_tags" {
  type        = map(string)
  description = "Specific tags."
  default     = {}
}

variable "rgpd_personal" {
  type        = bool
  description = "Indicates that project contains personal data"
}

variable "rgpd_confidential" {
  type        = bool
  description = "Indicates tha project contains confidential data"
}
