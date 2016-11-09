class CreateHomeWorks < ActiveRecord::Migration
  def change
    create_table :home_works do |t|
      t.string :title
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
