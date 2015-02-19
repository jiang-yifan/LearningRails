class Addfavs < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :integer, default: 0
  end
end
