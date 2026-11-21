# Terraform-модули IAM для Yandex Cloud

Модули Terraform для управления IAM в Yandex Cloud: сервисные аккаунты, роли на
уровне каталога и облака, ключи доступа и OIDC workload identity federation.

## Состав репозитория

### `modules/iam-account`

Создаёт сервисный аккаунт и связанные с ним ресурсы:

- роли на каталог (`folder_roles`) и на облако (`cloud_roles`);
- роли на самом сервисном аккаунте (`service_account_iam_members`) — например,
  `iam.serviceAccounts.user`, чтобы другой аккаунт или пользователь мог работать
  от его имени;
- статический ключ доступа, API-ключ и ключ сервисного аккаунта, в том числе с
  сохранением в Yandex Lockbox;
- OIDC workload identity federation (`workload_identity_federation`) и
  федеративные учётные данные (`workload_identity_subjects`) для внешних систем:
  GitHub Actions, GitLab CI, Kubernetes и других источников OIDC-токенов.
  Внешняя система получает IAM-токен сервисного аккаунта без статического ключа.

### `modules/iam-mappings`

Выдаёт роли участникам на уровне каталога (`folder_mappings`) и облака
(`cloud_mappings`). Участник задаётся IAM-идентификатором: `userAccount:<id>`,
`federatedUser:<id>`, `serviceAccount:<id>` или `group:<id>`. Для каждой пары
«участник × роль» создаётся отдельный ресурс `*_iam_member`.

### `wrappers`

Обёртка над `iam-account` для массового создания сервисных аккаунтов по карте
параметров.

## Примеры

| Пример | Что показывает |
| --- | --- |
| [`examples/iam-account/single`](examples/iam-account/single) | Полный набор возможностей `iam-account`: роли, все виды ключей, Lockbox, роли на самом аккаунте и OIDC workload identity federation для GitHub Actions. |
| [`examples/iam-account/multiple`](examples/iam-account/multiple) | Создание нескольких сервисных аккаунтов из одной карты параметров через `for_each`. |
| [`examples/iam-mappings`](examples/iam-mappings) | Выдача ролей на каталог и облако через `iam-mappings`. |

Все примеры рассчитаны на запуск в отдельном каталоге Yandex Cloud:

```bash
export YC_FOLDER_ID='<folder-id>'
terraform init
terraform plan
terraform apply
terraform destroy
```

## Быстрый старт

```hcl
module "iam_account" {
  source = "github.com/terraform-yacloud-modules/terraform-yandex-iam//modules/iam-account"

  name         = "app"
  folder_roles = ["editor"]

  workload_identity_federation = {
    name      = "app-github-oidc"
    issuer    = "https://token.actions.githubusercontent.com"
    jwks_url  = "https://token.actions.githubusercontent.com/.well-known/jwks"
    audiences = ["https://github.com/example/repo"]
  }

  workload_identity_subjects = [
    "repo:example/repo:ref:refs/heads/main",
  ]
}
```

## Требования

- Terraform >= 1.3;
- провайдер `yandex-cloud/yandex` >= 0.129.0 (workload identity federation
  появилась в этой версии).

## Лицензия

Apache-2.0. См. [LICENSE](LICENSE).
