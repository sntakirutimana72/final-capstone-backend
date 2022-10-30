class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, unique: true 
      t.integer :number_of_beds,  null: false
      t.decimal :price, null: false
      t.text :description
      t.references :room_type, foreign_key: true, on_delete: :cascade
      t.references :user, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
