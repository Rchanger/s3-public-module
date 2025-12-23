
variable "attribute" {
  description = "The attribute of the DynamoDB table"
  type        = list(object({ name: string, type: string }))
  default     = [{ name = "id", type = "S" }]
  nullable    = false
}

variable "billing_mode" {
  description = "The billing mode of the DynamoDB table"
  type        = string
  default     = "PROVISIONED"
  nullable    = true
}

variable "global_secondary_index" {
  description = "A list of maps representing the global secondary indexes"
  type        = list(object({ name: string, hash_key: string, range_key: string, projection_type: string, read_capacity: number, write_capacity: number }))
  default     = []
  nullable    = true
}

variable "hash_key" {
  description = "The hash key of the DynamoDB table"
  type        = string
  default     = "id"
  nullable    = false
}

variable "local_secondary_index" {
  description = "A list of maps representing the local secondary indexes"
  type        = list(object({ name: string, range_key : string, projection_type: string}))
  default     = []
  nullable    = true
}

variable "point_in_time_recovery" {
  description = "Point-in-time recovery options"
  type        = list(object({ enabled: bool }))
  default     = []
  nullable    = true
}

variable "range_key" {
  description = "The range key of the DynamoDB table"
  type        = string
  default     = ""
  nullable    = true
}

variable "server_side_encryption" {
  description = "Encryption at rest options. AWS DynamoDB tables are automatically encrypted at rest with an AWS-owned Customer Master Key if this argument isn't specified."
  type        = list(object({ enabled: bool, kms_key_arn: string }))
  default     = []
  nullable    = true
}

variable "stream_enabled" {
  description = "Indicates whether Streams is to be enabled (true) or disabled (false)"
  type        = bool
  nullable    = true
}

variable "stream_view_type" {
  description = "Indicates the DynamoDB Streams settings for the table"
  type        = string
  default     = "NEW_IMAGE"
  nullable    = true
}

variable "name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "my-table"
  nullable    = false
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
  default     = {}
  nullable    = true
}

variable "ttl" {
  description = "A map representing the TTL settings"
  type        = list(object({ attribute_name: string, enabled: bool }))
  default     = []
  nullable    = true
}

variable "write_capacity" {
  description = "Number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  type        = number
  default     = 1
  nullable    = true
}

variable "read_capacity" {
  description = "Number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  type        = number
  default     = 1
  nullable    = true
}

variable "timeouts" {
  description = "The timeouts for create, update and delete operations"
  type        = object({create: optional(string), update: optional(string), delete: optional(string)})
  nullable    = true
}
