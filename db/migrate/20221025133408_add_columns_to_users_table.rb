class AddColumnsToUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, default: ''
    add_column :users, :is_admin, :boolean, default: false, null: false
  end
end