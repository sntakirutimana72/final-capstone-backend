class CreateAccomodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accomodations do |t|
      t.string :name

      t.timestamps
    end
  end
end
