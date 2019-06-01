class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.integer :follower_user_id
      t.integer :folowee_user_id

      t.timestamps
    end
  end
end
