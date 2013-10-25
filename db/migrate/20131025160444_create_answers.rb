class CreateAnswers < ActiveRecord::Migration
	def up
		create_table :answers do |t|
	    	t.string :label_answer
	    	t.string :value_answer
	    	t.belongs_to :survey_form
	    	t.belongs_to :survey_field

	      	t.timestamps
	    end
	end

	def down
		drop_table :answers
	end
end
