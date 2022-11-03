class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :room, foreign_key: true, on_delelte: :cascade
      t.references :user, foreign_key: true, on_delelte: :cascade

      t.timestamps
    end
  end
end
