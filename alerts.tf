resource "mezmo_absence_alert" "alert_8174605a_cf7f_11ef_873f_366eacd66e4a" {
  component_kind          = "transform"
  component_id            = mezmo_route_processor.processor_fbd68680_cf79_11ef_9ad8_366eacd66e4a.id
  name                    = "Absence Alert over 5 Minutes - Missing_Flight_Events*"
  window_type             = "tumbling"
  window_duration_minutes = 5
  inputs                  = [mezmo_route_processor.processor_fbd68680_cf79_11ef_9ad8_366eacd66e4a.conditionals.0.output_name]
  event_type              = "log"
  group_by                = [".name", ".namespace", ".tags"]
  active                  = true
  alert_payload = {
    service = {
      ingestion_key = var.alert_8174605a_cf7f_11ef_873f_366eacd66e4a_ingestion_key
      message_text  = "This will send an alert to a test webhook."
      method        = "post"
      name          = "webhook"
      routing_key   = var.alert_8174605a_cf7f_11ef_873f_366eacd66e4a_routing_key
      uri           = "https://webhook.site/63e1c85b-5726-47e9-ad18-a27632498b7a"
    }
    throttling = {
      threshold   = 1
      window_secs = 60
    }
  }
  pipeline_id = mezmo_pipeline.pipeline_f251a348_e63a_11ee_a51f_562c83a610e2.id
}

