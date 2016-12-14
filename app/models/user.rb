class User < ApplicationRecord
  # Direct associations

  has_many   :private_parkings_accept,
             :class_name => "PrivateParking",
             :foreign_key => "acceptee_user_id",
             :dependent => :destroy

  has_many   :private_parkings_offer,
             :class_name => "PrivateParking",
             :foreign_key => "offeree_user_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :offeree_users,
             :through => :private_parkings_accept,
             :source => :offeree_user

  has_many   :acceptee_users,
             :through => :private_parkings_offer,
             :source => :acceptee_user

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
