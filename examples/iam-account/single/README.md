# iam-account single example

## Usage

To run this example you need to execute:

```bash
export YC_FOLDER_ID='folder_id'
terraform init
terraform plan
terraform apply
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.72.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_accounts"></a> [iam\_accounts](#module\_iam\_accounts) | ../../../modules/iam-account | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key_id"></a> [api\_key\_id](#output\_api\_key\_id) | Service account API key ID |
| <a name="output_id"></a> [id](#output\_id) | Service account ID |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Service account key ID |
| <a name="output_name"></a> [name](#output\_name) | Service account name |
| <a name="output_sak_access_key"></a> [sak\_access\_key](#output\_sak\_access\_key) | Service account static access key |
| <a name="output_sak_encrypted_secret_key"></a> [sak\_encrypted\_secret\_key](#output\_sak\_encrypted\_secret\_key) | Private (encrypted) part of service account static access key |
| <a name="output_sak_key_fingerprint"></a> [sak\_key\_fingerprint](#output\_sak\_key\_fingerprint) | The fingerprint of the PGP key used to encrypt the secret key |
| <a name="output_sak_secret_key"></a> [sak\_secret\_key](#output\_sak\_secret\_key) | Private part of service account static access key |
| <a name="output_static_access_key_id"></a> [static\_access\_key\_id](#output\_static\_access\_key\_id) | Service account static key ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
