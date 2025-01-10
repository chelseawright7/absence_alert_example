resource "mezmo_blackhole_destination" "destination_01790442_6ba1_11ef_adfa_2abb47387645" {
  ack_enabled = true
  title       = "blackhole"
  inputs      = [mezmo_route_processor.processor_fbd68680_cf79_11ef_9ad8_366eacd66e4a.conditionals.0.output_name]
  pipeline_id = mezmo_pipeline.pipeline_f251a348_e63a_11ee_a51f_562c83a610e2.id
}

