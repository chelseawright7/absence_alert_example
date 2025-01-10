resource "mezmo_demo_source" "json_logs" {
  pipeline_id = mezmo_pipeline.absence_alert_pipeline.id
  title       = "My source"
  description = "This is a demo source to give us some test data"
  format      = "json"
}
