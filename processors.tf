resource "mezmo_route_processor" "route_processor_01" {
  conditionals = [{
    expressions = [{
      field    = ".line"
      operator = "is_string"
      }, {
      field        = ".line"
      operator     = "contains"
      value_string = "com.aa.ctlctr.processor.listener.KafkaFlightHubMessageListener"
      }, {
      field        = ".line"
      operator     = "contains"
      value_string = "flight-event-aa"
      }, {
      field        = ".namespace"
      operator     = "contains"
      value_string = "gridgain"
    }]
    label             = "sev04-ne-get-flthub-kafka-listene-|-Missing_Flight_Events_AA_Partition"
    logical_operation = "AND"
  }]
  title       = "5 Minute absence"
  inputs      = [mezmo_demo_source.json_logs.id]
  pipeline_id = mezmo_pipeline.absence_alert_pipeline.id
}

