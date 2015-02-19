class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :track_type, null: false
      t.text :lyrics
      t.timestamps null: false
    end
    add_reference :tracks, :album, index: true
    add_index :tracks, [:album_id, :name], unique: true
  end
end
