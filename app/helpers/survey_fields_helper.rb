module SurveyFieldsHelper
	def title(survey_field)
		survey_field.title << (survey_field.mandatory ? "*" : "")
	end

	def value(survey_field)
		if params[:value_survey_field_id] != nil
			params[:value_survey_field_id][survey_field.id.to_s]
		end
	end
end