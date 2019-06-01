class Location < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "created_by_user_id"

  # Indirect associations

  # Validations

end
