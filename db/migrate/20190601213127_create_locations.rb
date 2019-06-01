class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city_name
      t.string :address
      t.string :state_name
      t.string :country_name
      t.integer :created_by_user_id

      t.timestamps
    end
  end
end
