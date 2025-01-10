resource "mezmo_absence_alert" "Alert" {
  component_kind          = "transform"
  component_id            = mezmo_route_processor.route_processor_01.id
  name                    = "Absence Alert over 5 Minutes - Missing_Flight_Events*"
  window_type             = "tumbling"
  window_duration_minutes = 5
  inputs                  = [mezmo_route_processor.route_processor_01.conditionals.0.output_name]
  event_type              = "log"
  group_by                = [".name", ".namespace", ".tags"]
  active                  = true
  alert_payload = {
    service = {
      //ingestion_key = var.Alert_ingestion_key
      message_text  = "This will send an alert to a test webhook."
      method        = "post"
      name          = "webhook"
      //routing_key   = var.Alert_routing_key
      uri           = "https://webhook.site/63e1c85b-5726-47e9-ad18-a27632498b7a"
    }
    throttling = {
      threshold   = 1
      window_secs = 60
    }
  }
  pipeline_id = mezmo_pipeline.absence_alert_pipeline.id
}

