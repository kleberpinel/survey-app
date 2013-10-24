class SurveyForm < ActiveRecord::Base
	belongs_to :user
	has_many :survey_fields, :dependent => :destroy

	attr_accessor :type_list, :description

	validates :title, presence: true
	validates_associated :survey_fields

	after_update :save_survey_fields

	def new_survey_fields_attributes=(survey_fields_attributes)
		survey_fields_attributes.each do |survey_fields_attribute|
			survey_fields.build(survey_fields_attribute)
		end
	end

	def existing_survey_fields_attributes=(survey_fields_attributes)
		
		survey_fields.reject(&:new_record?).each do |survey_field|

			attributes = survey_fields_attributes[survey_field.id.to_s]
			if attributes
				survey_field.attributes = attributes
			else
				survey_fields.delete(survey_field)
			end
		end
	end

	def save_survey_fields
		survey_fields.each do |survey_field|
			survey_field.save(false)
		end
	end

end
