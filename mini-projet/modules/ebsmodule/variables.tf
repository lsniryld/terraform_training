variable "size_volume" {
  type        = number
  description = "set disk size volume"
  default     = 1
}

variable "name_maintainer" {
  type        = string
  description = "name of the maintainer"
  default     = "niry"
}

variable "zone_name" {
  type        = string
  description = "zone name"
  default     = "us-east-1"
}
