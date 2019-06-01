class Bucket < ApplicationRecord
  # Direct associations

  belongs_to :photo

  has_many   :favorites,
             :dependent => :destroy

  has_many   :activities,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
