resource "yandex_iam_service_account" "main" {
  name        = var.name
  description = var.description
  folder_id   = var.folder_id
}

# TODO
#resource "yandex_iam_service_account_iam_binding" "main" {
#  service_account_id = yandex_iam_service_account.main.id
#  role               = "admin"
#
#  members = [
#    "userAccount:foo_user_id",
#  ]
#}
#
#resource "yandex_iam_service_account_iam_member" "main" {
#  service_account_id = yandex_iam_service_account.main.id
#  role               = "admin"
#  member             = "userAccount:bar_user_id"
#}
