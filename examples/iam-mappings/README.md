# iam-mappings example

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
