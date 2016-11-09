class AddVerifiedToHomeWork < ActiveRecord::Migration
  def change
    add_column :home_works, :verified, :boolean
  end
end
