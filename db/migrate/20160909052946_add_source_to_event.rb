class AddSourceToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :source, index: true, foreign_key: true
  end
end
