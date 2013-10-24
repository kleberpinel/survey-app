class CreateSurveyFieldOptions < ActiveRecord::Migration
  def up
    create_table :survey_field_options do |t|
      t.string :label
      t.integer :value
      t.belongs_to :survey_field

      t.timestamps
    end
  end
 
  def down
    drop_table :survey_field_options
  end
end
