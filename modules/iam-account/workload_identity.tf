locals {
  workload_identity_enabled = var.workload_identity_federation != null

  workload_identity_create_federation = local.workload_identity_enabled ? var.workload_identity_federation.create_federation : false

  workload_identity_federation_id = local.workload_identity_enabled ? coalesce(
    var.workload_identity_federation.existing_federation_id,
    try(yandex_iam_workload_identity_oidc_federation.main[0].id, null)
  ) : null

  workload_identity_subjects = local.workload_identity_enabled ? toset(var.workload_identity_subjects) : toset([])
}

# OIDC workload identity federation, created only when an existing one is not reused.
resource "yandex_iam_workload_identity_oidc_federation" "main" {
  count = local.workload_identity_create_federation ? 1 : 0

  name        = var.workload_identity_federation.name
  description = var.workload_identity_federation.description
  folder_id   = local.folder_id
  issuer      = var.workload_identity_federation.issuer
  jwks_url    = var.workload_identity_federation.jwks_url
  audiences   = length(var.workload_identity_federation.audiences) > 0 ? var.workload_identity_federation.audiences : null
  labels      = length(var.workload_identity_federation.labels) > 0 ? var.workload_identity_federation.labels : null
  disabled    = var.workload_identity_federation.disabled

  lifecycle {
    precondition {
      condition     = var.workload_identity_federation.name != null && var.workload_identity_federation.issuer != null
      error_message = "workload_identity_federation.name and workload_identity_federation.issuer are required when existing_federation_id is not set."
    }
  }
}

# Link between the federation, the service account and an exact external subject.
resource "yandex_iam_workload_identity_federated_credential" "main" {
  for_each = local.workload_identity_subjects

  federation_id       = local.workload_identity_federation_id
  service_account_id  = yandex_iam_service_account.main.id
  external_subject_id = each.value
}
