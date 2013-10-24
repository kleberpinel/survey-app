class AddFields < ActiveRecord::Migration
  def change
  	add_column :survey_forms, :description, :string

  	add_column :users, :name, :string
  	add_column :users, :birth, :datetime
  	add_column :users, :gender, :integer
  end
end
