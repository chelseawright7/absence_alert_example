
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

resource "mezmo_pipeline" "pipeline_f251a348_e63a_11ee_a51f_562c83a610e2" {
  title = "absence_alert_5min"
}
