class CreateSurveyFieldOptions < ActiveRecord::Migration
  def change
    create_table :survey_field_options do |t|
      t.string :label
      t.integer :value
      t.references :survey_field, index: true

      t.timestamps
    end
    
    def down
		 drop_table :survey_field_options
    end
  end
end
