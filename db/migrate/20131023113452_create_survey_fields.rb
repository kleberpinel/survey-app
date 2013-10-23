class CreateSurveyFields < ActiveRecord::Migration
  def change
    create_table :survey_fields do |t|
      t.string :title
      t.integer :survey_type_id
      t.references :survey_form, index: true

      t.timestamps
    end
    
    def down
		 drop_table :survey_fields
    end
  end
end
