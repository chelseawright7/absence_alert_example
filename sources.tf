resource "mezmo_agent_source" "source_08362990_6ba1_11ef_b64b_2abb47387645" {
  title            = "Mezmo Agent"
  shared_source_id = "e1b0eacc-e15c-11ee-9fa0-562c83a610e2"
  capture_metadata = true
  pipeline_id      = mezmo_pipeline.pipeline_f251a348_e63a_11ee_a51f_562c83a610e2.id
}

