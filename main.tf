
terraform {
  required_providers {
    mezmo = {
			source = "registry.terraform.io/mezmo/mezmo"
		}
  }
	required_version = ">= 1.1.0"
}

provider "mezmo" {
  auth_key = var.pipeline_auth_key
}

resource "mezmo_pipeline" "absence_alert_pipeline" {
  title = "absence_alert_5min"
}