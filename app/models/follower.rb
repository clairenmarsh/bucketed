class Follower < ApplicationRecord
  # Direct associations

  belongs_to :follower_user,
             :class_name => "User"

  # Indirect associations

  # Validations

end
