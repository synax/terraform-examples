variable "location" {
    description = "Defines the azure location, defaults to `westeurope`"
    type        = "string"
    default     = "westeurope"
}

variable "subnet_count" {
    description = "Specifies the amount of subnets to be deployed. defautls to `1`"
    type = "string"
    default = 1
}
