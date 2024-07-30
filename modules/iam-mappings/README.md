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

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_resourcemanager_cloud_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_cloud_iam_member) | resource |
| [yandex_resourcemanager_folder_iam_member.main](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Cloud-ID where where need to add permissions. If omitted default CLOUD\_ID will be used | `string` | `null` | no |
| <a name="input_cloud_mappings"></a> [cloud\_mappings](#input\_cloud\_mappings) | Group of IAM User-IDs and it's permissions in CLOUD<br>### Example<br>#cloud\_mappings = [<br>  {<br>    name  = "sre"<br>    users = ["userAccount:idxxxxxx1", "federatedUser:idxxxxxx2"]<br>    roles = ["editor", ]<br>  },<br>  {<br>    name  = "qa"<br>    users = ["userAccount:idxxxxxx3"]<br>    roles = ["viewer"]<br>  }<br> ] | `any` | `[]` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Folder-ID where need to add permissions. If omitted default FOLDER\_ID will be used | `string` | `null` | no |
| <a name="input_folder_mappings"></a> [folder\_mappings](#input\_folder\_mappings) | Group of IAM User-IDs and it's permissions in FOLDER<br>### Example<br>#folder\_mappings = [<br>  {<br>    name  = "devops"<br>    users = ["userAccount:idxxxxxx1", "federatedUser:idxxxxxx2"]<br>    roles = ["iam.serviceAccounts.user", "k8s.editor", "k8s.cluster-api.cluster-admin", "container-registry.admin"]<br>  },<br>  {<br>    name  = "developers"<br>    users = ["userAccount:idxxxxxx3"]<br>    roles = ["k8s.viewer"]<br>  }<br>] | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_mapping"></a> [cloud\_mapping](#output\_cloud\_mapping) | Cloud IAM mappings |
| <a name="output_folder_mapping"></a> [folder\_mapping](#output\_folder\_mapping) | Folder IAM mappings |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
