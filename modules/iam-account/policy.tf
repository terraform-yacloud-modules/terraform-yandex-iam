data "yandex_iam_policy" "main" {
  count = length(var.policy_binding) > 0 ? 1 : 0

  dynamic "binding" {
    for_each = var.policy_binding
    content {
      role    = binding.value["role"]
      members = binding.value["members"]
    }
  }
}

resource "yandex_iam_service_account_iam_policy" "main" {
  count = length(var.policy_binding) > 0 ? 1 : 0

  service_account_id = yandex_iam_service_account.main.id
  policy_data        = data.yandex_iam_policy.main[0].policy_data
}
