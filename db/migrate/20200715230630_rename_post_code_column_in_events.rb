class RenamePostCodeColumnInEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :post_code, :postcode
  end
end
