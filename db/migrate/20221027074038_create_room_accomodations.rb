class CreateRoomAccomodations < ActiveRecord::Migration[7.0]
  def change
    create_table :room_accomodations do |t|
      t.references :room, foreign_key: true, on_delelte: :cascade
      t.references :accomodation, foreign_key: true, on_delelte: :cascade

      t.timestamps
    end
  end
end
