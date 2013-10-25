class Answer < ActiveRecord::Base
	belongs_to :survey_form
	belongs_to :survey_field
end
