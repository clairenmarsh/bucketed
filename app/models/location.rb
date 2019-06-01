class Location < ApplicationRecord
  # Direct associations

  has_many   :lists,
             :class_name => "Bucket",
             :dependent => :destroy

  belongs_to :user,
             :foreign_key => "created_by_user_id"

  # Indirect associations

  # Validations

end
