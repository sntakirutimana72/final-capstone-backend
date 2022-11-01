class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :from_date, :date, null: false
    add_column :reservations, :to_date, :date, null: false
    add_column :reservations, :confirmed, :boolean
    add_column :reservations, :denial_reason, :string
  end
end
