class Photo < ApplicationRecord
  # Direct associations

  has_many   :buckets,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
