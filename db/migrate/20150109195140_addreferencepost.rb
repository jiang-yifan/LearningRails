class Addreferencepost < ActiveRecord::Migration
  def change
    add_reference :posts, :sub, index: true
    change_column :posts, :sub_id, :integer, null: false
  end
end
