class Activity < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :activity_type, :inclusion => { :in => [ 'Eat', 'Drink', 'Play' ]  }

  validates :status, :inclusion => { :in => [ 'Want to do', 'Done', 'Deleted' ]  }

end
