variable "name" {
  type        = string
  description = "Name of the StackSet. The name must be unique in the region where you create your StackSet. The name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and cannot be longer than 128 characters."
}

variable "capabilities" {
  type        = list(string)
  description = "(Optional) A list of capabilities. Valid values: CAPABILITY_IAM, CAPABILITY_NAMED_IAM, CAPABILITY_AUTO_EXPAND"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of tags to associate with this StackSet and the Stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the Stacks. A maximum number of 50 tags can be specified. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "template_url" {
  type        = string
  description = "(Optional) String containing the location of a file containing the CloudFormation template body. The URL must point to a template that is located in an Amazon S3 bucket. Maximum location file size: 460,800 bytes. Conflicts with template_body."
  default     = null
}

variable "template_body" {
  type        = string
  description = "(Optional) Structure containing the template body (max size: 51,200 bytes)."
  default     = null
}

variable "parameters" {
  description = "Key-value map of input parameters for the Stack template. All template parameters, including those with a Default, must be configured or ignored with lifecycle configuration block ignore_changes argument. All NoEcho template parameters must be ignored with the lifecycle configuration block ignore_changes argument."
  default     = {}
  type        = map(string)
}

variable "on_failure" {
  type        = string
  default     = "ROLLBACK"
  description = "(Optional) Action to be taken if stack creation fails. This must be one of: `DO_NOTHING`, `ROLLBACK`, or `DELETE`"
}

variable "timeout_in_minutes" {
  type        = number
  default     = 30
  description = "(Optional) The amount of time that can pass before the stack status becomes `CREATE_FAILED`."
}

variable "policy_body" {
  type        = string
  default     = ""
  description = "(Optional) Structure containing the stack policy body. Conflicts w/ `policy_url`."
}

variable "policy_url" {
  type        = string
  default     = ""
  description = "(Optional) Location of a file containing the stack policy. Conflicts w/ `policy_body`."
}

variable "iam_role_arn" {
  type        = string
  default     = ""
  description = "(Optional) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials."
}

variable "notification_arns" {
  type        = list(string)
  default     = []
  description = "(Optional) A list of SNS topic ARNs to publish stack related events."
}

variable "disable_rollback" {
  type        = bool
  default     = false
  description = "(Optional) Set to true to disable rollback of the stack if stack creation failed. Conflicts with on_failure."
}
