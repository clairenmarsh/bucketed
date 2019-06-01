class Location < ApplicationRecord
  # Direct associations

  has_many   :activities,
             :dependent => :destroy

  has_many   :users,
             :dependent => :destroy

  has_many   :lists,
             :class_name => "Bucket",
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "created_by_user_id"

  # Indirect associations

  # Validations

end
