class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :poster_id
      t.integer :activity_id
      t.integer :bucket_id

      t.timestamps
    end
  end
end
