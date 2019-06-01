class Comment < ApplicationRecord
  # Direct associations

  belongs_to :activity

  belongs_to :poster,
             :class_name => "User"

  # Indirect associations

  # Validations

end
