class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :activity_type
      t.string :title
      t.string :yelp_link
      t.integer :bucket_id
      t.integer :photo_id
      t.integer :location_id
      t.string :status

      t.timestamps
    end
  end
end
