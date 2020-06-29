class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user
      t.string :title
      t.string :description
      t.datetime :datetime
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
    end
  end
end
