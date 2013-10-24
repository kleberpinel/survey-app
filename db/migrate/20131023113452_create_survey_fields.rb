class CreateSurveyFields < ActiveRecord::Migration

  def up
    create_table :survey_fields do |t|
      t.string :title
      t.integer :survey_type_id
      t.belongs_to :survey_form

      t.timestamps
    end
  end
 
  def down
    drop_table :survey_fields
  end
  
end
