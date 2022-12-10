resource "google_service_account" "this" {
  account_id   = "service-${var.name}"
  display_name = var.name
  description  = "Service account for ${var.name} VM"
}

locals {
  iam_this = "serviceAccount:${google_service_account.this.email}"
}

resource "google_project_iam_member" "log_writer" {
  project = data.google_project.this.project_id
  role    = "roles/logging.logWriter"
  member  = local.iam_this
}

resource "google_project_iam_member" "metric_writer" {
  project = data.google_project.this.project_id
  role    = "roles/monitoring.metricWriter"
  member  = local.iam_this
}

resource "google_project_iam_member" "tracer" {
  project = data.google_project.this.project_id
  role    = "roles/cloudtrace.agent"
  member  = local.iam_this
}
