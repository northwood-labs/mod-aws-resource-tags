variable "app" {
  description = "The `app` tag. Lowercase and hyphenated."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-z-]+$", var.app))
    error_message = "Value should be lowercase and hyphenated."
  }
}

variable "env" {
  description = "The `env` tag. Lowercase."
  type        = string

  validation {
    condition     = can(regex("^(prod|nonprod|sandbox)$", var.env))
    error_message = "Value should be the lowercase version of one of the official SDLC identifiers."
  }
}

variable "additional_tags" {
  description = "Additional (ad hoc) tags to apply."
  default     = {}
}
