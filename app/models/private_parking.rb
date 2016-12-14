class PrivateParking < ApplicationRecord
  # Direct associations

  belongs_to :acceptee_user,
             :class_name => "User"

  belongs_to :offeree_user,
             :class_name => "User"

  # Indirect associations

  # Validations

end
