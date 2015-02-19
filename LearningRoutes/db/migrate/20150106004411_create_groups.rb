class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.timestamps null: false
    end
    add_index :groups, [:user_id, :contact_id], unique: true
    add_index :groups, :user_id
    add_index :groups, :contact_id
  end
end
