json.array! @trials do |trial|
  json.id trial.id
  json.system_id trial.system_id
  json.brief_title trial.brief_title
  json.contact_override trial.contact_override
  json.contact_override_first_name trial.contact_override_first_name
  json.contact_override_last_name trial.contact_override_last_name
  json.irb_number trial.irb_number
  json.overall_status trial.overall_status
  json.pi_id trial.pi_id
  json.pi_name trial.pi_name
  json.recruiting trial.recruiting
  json.simple_description trial.simple_description
  json.visible trial.visible
  json.keywords trial.keywords
end