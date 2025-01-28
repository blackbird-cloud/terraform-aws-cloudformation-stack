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
