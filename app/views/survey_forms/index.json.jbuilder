json.array!(@survey_forms) do |survey_form|
  json.extract! survey_form, :title, :requestor, :responses
  json.url survey_form_url(survey_form, format: :json)
end
