# Пример iam-account single

Полный пример модуля `iam-account`: сервисный аккаунт, роли на каталог, роли
на самом аккаунте, статический ключ в Lockbox, API-ключ и OIDC workload
identity federation для GitHub Actions.

Федерация создаётся с issuer `https://token.actions.githubusercontent.com`,
а федеративные учётные данные выдаются двум субъектам: ветке `main` и
pull request'ам репозитория `terraform-yacloud-modules/terraform-yandex-iam`.

## Использование

```bash
export YC_FOLDER_ID='folder_id'
terraform init
terraform plan
terraform apply
terraform destroy
```


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.129.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.250.0 |

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_iam_accounts"></a> [iam\_accounts](#module\_iam\_accounts) | ../../../modules/iam-account | n/a |

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_iam_service_account.sa_user](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_lockbox_secret.sa_static_key](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lockbox_secret) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | ID каталога Yandex Cloud, в котором создаются ресурсы. Имеет приоритет над YC\_FOLDER\_ID. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_api_key_id"></a> [api\_key\_id](#output\_api\_key\_id) | Service account API key ID |
| <a name="output_id"></a> [id](#output\_id) | Service account ID |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Service account key ID |
| <a name="output_name"></a> [name](#output\_name) | Service account name |
| <a name="output_sak_access_key"></a> [sak\_access\_key](#output\_sak\_access\_key) | Service account static access key |
| <a name="output_sak_encrypted_secret_key"></a> [sak\_encrypted\_secret\_key](#output\_sak\_encrypted\_secret\_key) | Private (encrypted) part of service account static access key |
| <a name="output_sak_key_fingerprint"></a> [sak\_key\_fingerprint](#output\_sak\_key\_fingerprint) | The fingerprint of the PGP key used to encrypt the secret key |
| <a name="output_sak_secret_key"></a> [sak\_secret\_key](#output\_sak\_secret\_key) | Private part of service account static access key |
| <a name="output_static_access_key_id"></a> [static\_access\_key\_id](#output\_static\_access\_key\_id) | Service account static key ID |
| <a name="output_workload_identity_credential_ids"></a> [workload\_identity\_credential\_ids](#output\_workload\_identity\_credential\_ids) | Map of external subject ID to federated credential ID |
| <a name="output_workload_identity_federation_id"></a> [workload\_identity\_federation\_id](#output\_workload\_identity\_federation\_id) | OIDC workload identity federation ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
