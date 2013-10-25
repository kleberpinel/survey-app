class ChangeSurveyForm < ActiveRecord::Migration
  def change
  	add_column :survey_forms, :restrict, :boolean
  end
end
