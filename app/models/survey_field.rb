class SurveyField < ActiveRecord::Base
	belongs_to :survey_form
	has_many :survey_field_options, :dependent => :destroy

	def new_survey_field_options_attributes=(survey_field_options_attributes)
		survey_field_options_attributes.each do |survey_field_options_attribute|
			survey_field_options.build(survey_field_options_attribute)
		end
	end

	def existing_survey_field_options_attributes=(survey_fields_options_attributes)
		
		survey_field_options.reject(&:new_record?).each do |survey_fields_option|
			attributes = survey_fields_options_attributes[survey_fields_option.id.to_s]
			if attributes
				survey_fields_option.attributes = attributes
				survey_fields_option.save()
			else
				survey_field_options.delete(survey_fields_option)
			end
		end
	end

	def save_survey_fields_options
		survey_field_options.each do |survey_fields_option|
			survey_fields_option.save(false)
		end
	end

end
