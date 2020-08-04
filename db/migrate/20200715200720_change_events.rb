class ChangeEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :latitude, :decimal
    remove_column :events, :longitude, :decimal
    add_column :events, :street, :string
    add_column :events, :city, :string
    add_column :events, :post_code, :string
  end
end
