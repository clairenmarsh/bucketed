class Activity < ApplicationRecord
  # Direct associations

  belongs_to :bucket,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :activity_type, :inclusion => { :in => [ 'Eat', 'Drink', 'Play' ]  }

  validates :status, :inclusion => { :in => [ 'Want to do', 'Done', 'Deleted' ]  }

end
