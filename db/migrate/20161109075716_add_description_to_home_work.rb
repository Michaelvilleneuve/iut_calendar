class AddDescriptionToHomeWork < ActiveRecord::Migration
  def change
    add_column :home_works, :description, :text
  end
end
