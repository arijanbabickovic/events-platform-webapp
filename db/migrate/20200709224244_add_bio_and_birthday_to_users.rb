class AddBioAndBirthdayToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :birthday, :date
    add_column :users, :city, :string
  end
end
