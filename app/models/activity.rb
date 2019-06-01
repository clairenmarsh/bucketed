class Activity < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :status, :inclusion => { :in => [ 'Want to do', 'Done', 'Deleted' ]  }

end
