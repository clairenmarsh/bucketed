class AddActivityCountToBuckets < ActiveRecord::Migration[5.1]
  def change
    add_column :buckets, :activities_count, :integer
  end
end
