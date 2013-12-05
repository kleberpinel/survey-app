class Answer < ActiveRecord::Base
	belongs_to :survey_form
	belongs_to :survey_field
	belongs_to :user
	
	validates :value_answer, :presence => true, :if => :mandatory?
 
  	def mandatory?
  		if value_answer.blank?	
  			errors.add(:survey_field, "O campo '#{survey_field.title}' não pode ficar em branco")
  		end
    	survey_field.mandatory == true
  	end
end
