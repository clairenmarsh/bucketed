class Bucket < ApplicationRecord
  # Direct associations

  has_many   :activities,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
