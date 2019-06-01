class Activity < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :favorites,
             :dependent => :destroy

  belongs_to :bucket,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :activity_type, :inclusion => { :in => [ 'Eat', 'Drink', 'Play' ]  }

  validates :status, :inclusion => { :in => [ 'Want to do', 'Done', 'Deleted' ]  }

end
