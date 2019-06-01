class User < ApplicationRecord
  # Direct associations

  belongs_to :photo

  has_many   :followers2,
             :class_name => "Follower",
             :foreign_key => "folowee_user_id",
             :dependent => :destroy

  has_many   :followers,
             :foreign_key => "follower_user_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "poster_id",
             :dependent => :destroy

  has_many   :buckets,
             :dependent => :destroy

  has_many   :locations,
             :foreign_key => "created_by_user_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
