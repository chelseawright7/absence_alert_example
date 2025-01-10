resource "mezmo_blackhole_destination" "blackhole_example_destination_for_testing" {
  ack_enabled = true
  title       = "blackhole"
  inputs      = [mezmo_route_processor.route_processor_01.conditionals.0.output_name]
  pipeline_id = mezmo_pipeline.absence_alert_pipeline.id
}

