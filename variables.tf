variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = "string"
}

variable "force_destroy" {
  description = "Force destroy non-empty S3 bucket on destroy"
  default     = false
}

variable "region" {
  description = "Region in which to create the S3 bucket"
  type        = "string"
}

variable "glacier_transition_days" {
  description = "Number of days to transition objects to GLACIER"
  type        = "string"
}

variable "expiration_days" {
  description = "Number of days to expire objects"
  type        = "string"
}

variable "tags" {
  description = "Tags for resources that support them"
  type        = "map"
  default     = {}
}

variable "is_multi_region_trail" {
  description = "Enable cloudtrail events from all regions, not just the current one"
  type        = "string"
  default     = true
}

variable "include_global_service_events" {
  description = "Whether or not to include global service events, not just regional services"
  type        = "string"
  default     = true
}
