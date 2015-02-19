class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :category, null: false

      t.timestamps null: false
    end

    add_index :albums, :name
    add_index :albums, :category
    add_reference :albums, :band, index: true
  end
end
