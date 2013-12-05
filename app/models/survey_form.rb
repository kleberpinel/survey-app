class SurveyForm < ActiveRecord::Base
	belongs_to :user
	has_many :survey_fields, :dependent => :destroy
	has_many :answers

	attr_accessor :type_list

	validates :title, presence: true
	validates :description, presence: true

	accepts_nested_attributes_for :survey_fields, reject_if: proc { |attributes| attributes['title'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :answers

	# accepts_nested_attributes_for :answers, reject_if: :valid_answers? 

	# def valid_answers?(attributes)

 #      if attributes['value_answer'].blank?
 #      	Rails.logger.debug "!!!!!!!! ERROR"
 #      	errors[:base] << "can't be greater than total value"
 #      	errors.add(:answers, "cannot contain the characters !@#%*()_-+=")
 #      	self.errors.add :base, 'Please ensure that Interest field do not contain HTML(< and >) tags'
 #      end

 #      !attributes['value_answer'].blank?
	# end

end
