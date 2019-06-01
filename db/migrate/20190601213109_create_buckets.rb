class CreateBuckets < ActiveRecord::Migration[5.1]
  def change
    create_table :buckets do |t|
      t.integer :location_id
      t.integer :user_id
      t.string :bucket_name
      t.integer :photo_id

      t.timestamps
    end
  end
end
