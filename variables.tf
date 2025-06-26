variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "Wisdom-Pet-Medicine"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "West Europe"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "wpm-appservice-plan12"
}

variable "app_service_plan_sku" {
  description = "SKU name for the App Service Plan (e.g. F1, B1, S1)"
  type        = string
  default     = "B1"
}

variable "os_type" {
  description = "Operating system for the App Service Plan"
  type        = string
  default     = "Linux"
}

variable "web_name" {
   description = "the name of the web application"
   type = string
   default = "wpmappservice1210"
}