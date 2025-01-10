resource "mezmo_route_processor" "processor_fbd68680_cf79_11ef_9ad8_366eacd66e4a" {
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
  inputs      = [mezmo_agent_source.source_08362990_6ba1_11ef_b64b_2abb47387645.id]
  pipeline_id = mezmo_pipeline.pipeline_f251a348_e63a_11ee_a51f_562c83a610e2.id
}

