class SurveyField < ActiveRecord::Base
	belongs_to :survey_form
	has_many :survey_field_options, :dependent => :destroy

	accepts_nested_attributes_for :survey_field_options, reject_if: proc { |attributes| attributes['label'].blank? }, allow_destroy: true
end
