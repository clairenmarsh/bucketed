class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :activity_id
      t.integer :bucket_id

      t.timestamps
    end
  end
end
