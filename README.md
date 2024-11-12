<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.75 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.75 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sentinel-test-sg"></a> [sentinel-test-sg](#module\_sentinel-test-sg) | ./modules/sg/v0.1 | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc/v0.1 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | AWS Region to use | `string` | `"ap-northeast-2"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->