# iam-mappings example

Пример создаёт два сервисных аккаунта и выдаёт им роли через модуль `iam-mappings`:
мониторинговому — роли на уровне каталога, административному — на уровне облака.

## Что означает `name` в mappings

`name` — это произвольная метка группы, нужная только человеку, который читает конфигурацию.
Модуль её нигде не использует: она не попадает ни в имена ресурсов, ни в `member`, ни в `role`.
На результат влияют только `users` и `roles`, поэтому две группы с одинаковым `name`
просто станут неразличимы в конфигурации и больше ни на что не повлияют.

`name` — это не имя каталога и не имя облака: каталог задаётся через `folder_id`
(по умолчанию берётся из `YC_FOLDER_ID`), облако — через `cloud_id` (по умолчанию из
конфигурации провайдера).

## Что реально создаётся

Модуль перемножает `users` и `roles` и на каждую пару создаёт отдельный ресурс:
`yandex_resourcemanager_folder_iam_member` для `folder_mappings` и
`yandex_resourcemanager_cloud_iam_member` для `cloud_mappings`.

В примере группа `monitoring` содержит одного участника и две роли, поэтому появится
две привязки — `viewer` и `monitoring.viewer` для
`serviceAccount:<id мониторингового аккаунта>`. То есть да, сервисному аккаунту
выдаётся весь перечисленный список ролей: по одной привязке на каждую роль.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_mapping"></a> [iam\_mapping](#module\_iam\_mapping) | ../../modules/iam-mappings | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_iam_service_account.admin_sa](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account.monitoring_sa](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_service_account_id"></a> [admin\_service\_account\_id](#output\_admin\_service\_account\_id) | ID созданного сервисного аккаунта для администрирования |
| <a name="output_cloud_mappings"></a> [cloud\_mappings](#output\_cloud\_mappings) | Назначенные права на уровне cloud |
| <a name="output_folder_mappings"></a> [folder\_mappings](#output\_folder\_mappings) | Назначенные права на уровне folder |
| <a name="output_monitoring_service_account_id"></a> [monitoring\_service\_account\_id](#output\_monitoring\_service\_account\_id) | ID созданного сервисного аккаунта для мониторинга |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
