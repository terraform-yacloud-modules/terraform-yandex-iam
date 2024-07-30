# iam-account example

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

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_iam_service_account.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account_api_key.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_api_key) | resource |
| [yandex_iam_service_account_key.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_key) | resource |
| [yandex_iam_service_account_static_access_key.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_static_access_key) | resource |
| [yandex_resourcemanager_cloud_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_cloud_iam_member) | resource |
| [yandex_resourcemanager_folder_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_key_algorithm"></a> [account\_key\_algorithm](#input\_account\_key\_algorithm) | The algorithm used to generate the key | `string` | `"RSA_4096"` | no |
| <a name="input_account_key_format"></a> [account\_key\_format](#input\_account\_key\_format) | The output format of the keys | `string` | `"PEM_FILE"` | no |
| <a name="input_account_key_pgp_key"></a> [account\_key\_pgp\_key](#input\_account\_key\_pgp\_key) | An optional PGP key to encrypt the resulting private key material | `string` | `null` | no |
| <a name="input_api_key_pgp_key"></a> [api\_key\_pgp\_key](#input\_api\_key\_pgp\_key) | An optional PGP key to encrypt the resulting private key material | `string` | `null` | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Cloud-ID where where need to add permissions. If omitted default CLOUD\_ID will be used | `string` | `null` | no |
| <a name="input_cloud_roles"></a> [cloud\_roles](#input\_cloud\_roles) | A list of roles that will be attached to in cloud scope | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Service account description | `string` | `""` | no |
| <a name="input_enable_account_key"></a> [enable\_account\_key](#input\_enable\_account\_key) | If true, account key key will be created | `bool` | `false` | no |
| <a name="input_enable_api_key"></a> [enable\_api\_key](#input\_enable\_api\_key) | If true, API key will be created | `bool` | `false` | no |
| <a name="input_enable_static_access_key"></a> [enable\_static\_access\_key](#input\_enable\_static\_access\_key) | If true, static access key will be created | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder-ID where need to add permissions. If omitted default FOLDER\_ID will be used | `string` | `null` | no |
| <a name="input_folder_roles"></a> [folder\_roles](#input\_folder\_roles) | A list of roles that will be attached to in folder scope | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Service account name | `string` | n/a | yes |
| <a name="input_static_access_key_pgp_key"></a> [static\_access\_key\_pgp\_key](#input\_static\_access\_key\_pgp\_key) | An optional PGP key to encrypt the resulting private key material | `string` | `null` | no |

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
