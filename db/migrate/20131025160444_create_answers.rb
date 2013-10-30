class CreateAnswers < ActiveRecord::Migration
	def up
		create_table :answers do |t|
	    	t.string :label_answer
	    	t.string :value_answer
	    	t.string :identifier
	    	t.belongs_to :survey_form
	    	t.belongs_to :survey_field
	    	t.belongs_to :user

	      	t.timestamps
	    end

	    add_index :answers, :identifier
	end

	def down
		drop_table :answers
	end
end
