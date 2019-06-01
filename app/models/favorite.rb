class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :activity

  belongs_to :bucket

  # Indirect associations

  # Validations

end
