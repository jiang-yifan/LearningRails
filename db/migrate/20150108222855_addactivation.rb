class Addactivation < ActiveRecord::Migration
  def change
    add_column :users, :activated, :boolean
    add_column :users, :activation_token, :string
    change_column :users, :activated, :boolean, default: false
  end
end
