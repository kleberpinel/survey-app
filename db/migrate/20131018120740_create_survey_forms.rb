class CreateSurveyForms < ActiveRecord::Migration
  def change
    create_table :survey_forms do |t|
      t.string :title
      t.integer :responses
      t.belongs_to :user

      t.timestamps
    end

    def down
		  drop_table :survey_forms
    end
  end
end
