class CreateRoomsAccomodations < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms_accomodations do |t|
      t.references :room, null: false, foreign_key: true
      t.references :accomodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
