class SurveyForm < ActiveRecord::Base
	belongs_to :user

	attr_accessor :type_list

	validates :title, presence: true
end
