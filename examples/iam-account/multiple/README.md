# iam-account multiple example

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
| <a name="module_iam_accounts"></a> [iam\_accounts](#module\_iam\_accounts) | ../../modules/iam-account | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam"></a> [iam](#input\_iam) | n/a | `map` | <pre>{<br>  "app": {<br>    "cloud_roles": [<br>      "editor"<br>    ],<br>    "enabled": true,<br>    "folder_roles": [<br>      "editor"<br>    ]<br>  }<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
