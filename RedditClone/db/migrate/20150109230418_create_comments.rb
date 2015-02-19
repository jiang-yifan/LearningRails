class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :author_id, null: false
      t.integer :parent_comment_id

      t.timestamps null: false
    end

    add_index :comments, :author_id
    add_reference :comments, :commentable, index: true, polymorphic: true
  end
end
