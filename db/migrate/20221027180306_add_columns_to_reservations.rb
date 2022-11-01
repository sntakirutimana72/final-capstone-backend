class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :from_date, :date
    add_column :reservations, :to_date, :date
  end
end
