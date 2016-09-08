class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :room, :string
    add_column :events, :teacher, :string
  end
end
