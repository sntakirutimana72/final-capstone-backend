class AddPictureToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :picture, :text
  end
end
