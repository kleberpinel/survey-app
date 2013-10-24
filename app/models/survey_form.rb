class SurveyForm < ActiveRecord::Base
	belongs_to :user
	has_many :survey_fields, :dependent => :destroy

	attr_accessor :type_list

	validates :title, presence: true
	validates :description, presence: true

	accepts_nested_attributes_for :survey_fields, reject_if: proc { |attributes| attributes['title'].blank? }, allow_destroy: true

end
