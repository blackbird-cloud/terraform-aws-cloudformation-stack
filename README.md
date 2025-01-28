# Terraform Aws Cloudformation Stack Module
Terraform module to create an AWS CloudFormation stack

[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://blackbird.cloud)

## Example
```hcl
module "account_info" {
  source  = "blackbird-cloud/account-info/aws"
  version = "~> 2"
}

module "stack" {
  source  = "blackbird-cloud/cloudformation-stack/aws"
  version = "~> 1"

  name         = "AWSCloudFormationStackSetExecutionRole"
  template_url = "https://s3.amazonaws.com/cloudformation-stackset-sample-templates-us-east-1/AWSCloudFormationStackSetExecutionRole.yml"

  parameters = {
    AdministratorAccountId = module.account_info.account_id
  }

  capabilities = ["CAPABILITY_NAMED_IAM"]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | (Optional) A list of capabilities. Valid values: CAPABILITY\_IAM, CAPABILITY\_NAMED\_IAM, CAPABILITY\_AUTO\_EXPAND | `list(string)` | `[]` | no |
| <a name="input_disable_rollback"></a> [disable\_rollback](#input\_disable\_rollback) | (Optional) Set to true to disable rollback of the stack if stack creation failed. Conflicts with on\_failure. | `bool` | `false` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | (Optional) The ARN of an IAM role that AWS CloudFormation assumes to create the stack. If you don't specify a value, AWS CloudFormation uses the role that was previously associated with the stack. If no role is available, AWS CloudFormation uses a temporary session that is generated from your user credentials. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the StackSet. The name must be unique in the region where you create your StackSet. The name can contain only alphanumeric characters (case-sensitive) and hyphens. It must start with an alphabetic character and cannot be longer than 128 characters. | `string` | n/a | yes |
| <a name="input_notification_arns"></a> [notification\_arns](#input\_notification\_arns) | (Optional) A list of SNS topic ARNs to publish stack related events. | `list(string)` | `[]` | no |
| <a name="input_on_failure"></a> [on\_failure](#input\_on\_failure) | (Optional) Action to be taken if stack creation fails. This must be one of: `DO_NOTHING`, `ROLLBACK`, or `DELETE` | `string` | `"ROLLBACK"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Key-value map of input parameters for the Stack template. All template parameters, including those with a Default, must be configured or ignored with lifecycle configuration block ignore\_changes argument. All NoEcho template parameters must be ignored with the lifecycle configuration block ignore\_changes argument. | `map(string)` | `{}` | no |
| <a name="input_policy_body"></a> [policy\_body](#input\_policy\_body) | (Optional) Structure containing the stack policy body. Conflicts w/ `policy_url`. | `string` | `""` | no |
| <a name="input_policy_url"></a> [policy\_url](#input\_policy\_url) | (Optional) Location of a file containing the stack policy. Conflicts w/ `policy_body`. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Key-value map of tags to associate with this StackSet and the Stacks created from it. AWS CloudFormation also propagates these tags to supported resources that are created in the Stacks. A maximum number of 50 tags can be specified. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `{}` | no |
| <a name="input_template_body"></a> [template\_body](#input\_template\_body) | (Optional) Structure containing the template body (max size: 51,200 bytes). | `string` | `null` | no |
| <a name="input_template_url"></a> [template\_url](#input\_template\_url) | (Optional) String containing the location of a file containing the CloudFormation template body. The URL must point to a template that is located in an Amazon S3 bucket. Maximum location file size: 460,800 bytes. Conflicts with template\_body. | `string` | `null` | no |
| <a name="input_timeout_in_minutes"></a> [timeout\_in\_minutes](#input\_timeout\_in\_minutes) | (Optional) The amount of time that can pass before the stack status becomes `CREATE_FAILED`. | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stack"></a> [stack](#output\_stack) | CloudFormation Stack resource. |

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2024 [Blackbird Cloud](https://blackbird.cloud)