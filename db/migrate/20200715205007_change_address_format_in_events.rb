class ChangeAddressFormatInEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :street, :string
    add_column :events, :address_first_line, :string
    add_column :events, :address_second_line, :string
  end
end
