class AddPermissionsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :permissions, :string, default: "regular"
  end
end
