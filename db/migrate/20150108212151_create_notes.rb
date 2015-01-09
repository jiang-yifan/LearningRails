class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note, null: false
      t.timestamps null: false
    end
    
    add_reference :notes, :user, index: true
    add_reference :notes, :track, index: true
  end
end
