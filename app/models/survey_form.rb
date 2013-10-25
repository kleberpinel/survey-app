class SurveyForm < ActiveRecord::Base
	belongs_to :user
	has_many :survey_fields, :dependent => :destroy
	has_many :answers

	attr_accessor :type_list

	validates :title, presence: true
	validates :description, presence: true

	accepts_nested_attributes_for :survey_fields, reject_if: proc { |attributes| attributes['title'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['value_answer'] == "" }

	def valid_answers?
		Rails.logger.debug "valid_answers"
		answers.each { |attributes| 
			Rails.logger.debug "------------ #{attributes.inspect}"
		}
	end

end
