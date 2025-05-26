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
    condition     = can(regex("^(msa|prod|nonprod|sandbox)$", var.env))
    error_message = "Value should be the lowercase version of one of the official SDLC identifiers."
  }
}

variable "is_foundational" {
  description = "Whether or not this is a foundational piece of infrastructure. A value of `true` will add the `foundational` and `cloud-nuke-after` tags. A value of `false` will not."
  type        = bool
  default     = false
}

variable "extra" {
  description = "Additional (ad hoc) tags to apply."
  default     = {}
}
