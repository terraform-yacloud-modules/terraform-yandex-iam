# Модуль iam-account

Создаёт сервисный аккаунт Yandex Cloud, выдаёт ему роли на каталог и облако,
управляет ролями на самом аккаунте и выпускает ключи: статический, API и ключ
сервисного аккаунта. Ключи можно сохранять в Yandex Lockbox.

## Workload identity federation

Переменная `workload_identity_federation` включает OIDC-федерацию:

- при `create_federation = false` и заданном `existing_federation_id` модуль
  переиспользует существующую федерацию;
- иначе (`create_federation = true`, по умолчанию) создаётся новая федерация с
  указанными `name`, `issuer`, `jwks_url`, `audiences` и `labels`;
- для каждого значения из `workload_identity_subjects` создаётся
  `yandex_iam_workload_identity_federated_credential`, привязанный к этому
  сервисному аккаунту.

Так GitHub Actions, GitLab CI или Kubernetes могут получить IAM-токен
сервисного аккаунта без статического ключа. Список субъектов задаётся точным
совпадением (`external_subject_id`).

## Использование

```bash
export YC_FOLDER_ID='folder_id'
terraform init
terraform plan
terraform apply
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
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.129.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_iam_service_account.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account_api_key.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_api_key) | resource |
| [yandex_iam_service_account_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_iam_member) | resource |
| [yandex_iam_service_account_key.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_key) | resource |
| [yandex_iam_service_account_static_access_key.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_static_access_key) | resource |
| [yandex_iam_workload_identity_federated_credential.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_workload_identity_federated_credential) | resource |
| [yandex_iam_workload_identity_oidc_federation.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_workload_identity_oidc_federation) | resource |
| [yandex_resourcemanager_cloud_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_cloud_iam_member) | resource |
| [yandex_resourcemanager_folder_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_account_key_algorithm"></a> [account\_key\_algorithm](#input\_account\_key\_algorithm) | The algorithm used to generate the key | `string` | `"RSA_4096"` | no |
| <a name="input_account_key_description"></a> [account\_key\_description](#input\_account\_key\_description) | The account key description | `string` | `""` | no |
| <a name="input_account_key_format"></a> [account\_key\_format](#input\_account\_key\_format) | The output format of the keys | `string` | `"PEM_FILE"` | no |
| <a name="input_account_key_output_to_lockbox"></a> [account\_key\_output\_to\_lockbox](#input\_account\_key\_output\_to\_lockbox) | Configuration for storing account key in Yandex Lockbox secret | <pre>object({<br/>    secret_id             = string<br/>    entry_for_private_key = string<br/>  })</pre> | `null` | no |
| <a name="input_account_key_pgp_key"></a> [account\_key\_pgp\_key](#input\_account\_key\_pgp\_key) | An optional PGP key to encrypt the resulting private key material | `string` | `null` | no |
| <a name="input_api_key_description"></a> [api\_key\_description](#input\_api\_key\_description) | The api key description | `string` | `""` | no |
| <a name="input_api_key_expires_at"></a> [api\_key\_expires\_at](#input\_api\_key\_expires\_at) | The key will be no longer valid after expiration timestamp. Example: 2024-11-11T00:00:00Z | `string` | `null` | no |
| <a name="input_api_key_output_to_lockbox"></a> [api\_key\_output\_to\_lockbox](#input\_api\_key\_output\_to\_lockbox) | Configuration for storing API key in Yandex Lockbox secret | <pre>object({<br/>    secret_id = string<br/>    key       = string<br/>  })</pre> | `null` | no |
| <a name="input_api_key_pgp_key"></a> [api\_key\_pgp\_key](#input\_api\_key\_pgp\_key) | An optional PGP key to encrypt the resulting private key material | `string` | `null` | no |
| <a name="input_api_key_scopes"></a> [api\_key\_scopes](#input\_api\_key\_scopes) | The list of scopes of the key. | `list(string)` | `[]` | no |
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Cloud-ID where where need to add permissions. If omitted default CLOUD\_ID will be used | `string` | `null` | no |
| <a name="input_cloud_roles"></a> [cloud\_roles](#input\_cloud\_roles) | A list of roles that will be attached to in cloud scope | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Service account description | `string` | `""` | no |
| <a name="input_enable_account_key"></a> [enable\_account\_key](#input\_enable\_account\_key) | If true, account key key will be created | `bool` | `false` | no |
| <a name="input_enable_api_key"></a> [enable\_api\_key](#input\_enable\_api\_key) | If true, API key will be created | `bool` | `false` | no |
| <a name="input_enable_static_access_key"></a> [enable\_static\_access\_key](#input\_enable\_static\_access\_key) | If true, static access key will be created | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder-ID where need to add permissions. If omitted default FOLDER\_ID will be used | `string` | `null` | no |
| <a name="input_folder_roles"></a> [folder\_roles](#input\_folder\_roles) | A list of roles that will be attached to in folder scope | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Service account name | `string` | n/a | yes |
| <a name="input_service_account_iam_members"></a> [service\_account\_iam\_members](#input\_service\_account\_iam\_members) | List of { role, member } to grant roles on this service account (e.g. iam.serviceAccounts.user). Member format: userAccount:id, serviceAccount:id, federatedUser:id, system:group:id | <pre>list(object({<br/>    role   = string<br/>    member = string<br/>  }))</pre> | `[]` | no |
| <a name="input_static_access_key_description"></a> [static\_access\_key\_description](#input\_static\_access\_key\_description) | The static access key description | `string` | `""` | no |
| <a name="input_static_access_key_output_to_lockbox"></a> [static\_access\_key\_output\_to\_lockbox](#input\_static\_access\_key\_output\_to\_lockbox) | Configuration for storing static access key in Yandex Lockbox secret | <pre>object({<br/>    secret_id            = string<br/>    entry_for_access_key = string<br/>    entry_for_secret_key = string<br/>  })</pre> | `null` | no |
| <a name="input_static_access_key_pgp_key"></a> [static\_access\_key\_pgp\_key](#input\_static\_access\_key\_pgp\_key) | An optional PGP key to encrypt the resulting private key material | `string` | `null` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Timeout settings for cluster operations | <pre>object({<br/>    create = optional(string)<br/>    update = optional(string)<br/>    delete = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_workload_identity_federation"></a> [workload\_identity\_federation](#input\_workload\_identity\_federation) | Optional OIDC workload identity federation for the service account.<br/>When set, the module creates a new federation (create\_federation = true, the<br/>default) or reuses an existing one (create\_federation = false together with<br/>existing\_federation\_id) and issues federated credentials for every subject from<br/>workload\_identity\_subjects. | <pre>object({<br/>    create_federation      = optional(bool, true)<br/>    name                   = optional(string)<br/>    description            = optional(string, "")<br/>    issuer                 = optional(string)<br/>    jwks_url               = optional(string)<br/>    audiences              = optional(list(string), [])<br/>    labels                 = optional(map(string), {})<br/>    disabled               = optional(bool, false)<br/>    existing_federation_id = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_workload_identity_subjects"></a> [workload\_identity\_subjects](#input\_workload\_identity\_subjects) | External subject IDs (exact match) allowed to get an IAM token for this service account. Used only together with workload\_identity\_federation | `list(string)` | `[]` | no |

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
| <a name="output_workload_identity_federation_id"></a> [workload\_identity\_federation\_id](#output\_workload\_identity\_federation\_id) | OIDC workload identity federation ID (created or reused) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
