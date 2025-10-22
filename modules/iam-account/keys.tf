resource "yandex_iam_service_account_api_key" "main" {
  count = var.enable_api_key ? 1 : 0

  service_account_id = yandex_iam_service_account.main.id
  description        = ""
  pgp_key            = var.api_key_pgp_key

  dynamic "output_to_lockbox" {
    for_each = var.api_key_output_to_lockbox != null ? [var.api_key_output_to_lockbox] : []
    content {
      secret_id            = output_to_lockbox.value.secret_id
      entry_for_secret_key = output_to_lockbox.value.key
    }
  }
}

resource "yandex_iam_service_account_key" "main" {
  count = var.enable_account_key ? 1 : 0

  service_account_id = yandex_iam_service_account.main.id
  description        = ""
  format             = var.account_key_format
  key_algorithm      = var.account_key_algorithm
  pgp_key            = var.account_key_pgp_key

  dynamic "output_to_lockbox" {
    for_each = var.account_key_output_to_lockbox != null ? [var.account_key_output_to_lockbox] : []
    content {
      secret_id             = output_to_lockbox.value.secret_id
      entry_for_private_key = output_to_lockbox.value.key
    }
  }
}

resource "yandex_iam_service_account_static_access_key" "main" {
  count = var.enable_static_access_key ? 1 : 0

  service_account_id = yandex_iam_service_account.main.id
  description        = ""
  pgp_key            = var.static_access_key_pgp_key

  dynamic "output_to_lockbox" {
    for_each = var.static_access_key_output_to_lockbox != null ? [var.static_access_key_output_to_lockbox] : []
    content {
      secret_id            = output_to_lockbox.value.secret_id
      entry_for_access_key = output_to_lockbox.value.key
      entry_for_secret_key = "${output_to_lockbox.value.key}_secret"
    }
  }
}
