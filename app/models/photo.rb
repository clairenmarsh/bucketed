class Photo < ApplicationRecord
  # Direct associations

  has_many   :activities,
             :dependent => :destroy

  has_many   :users,
             :dependent => :destroy

  has_many   :buckets,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
