class Keep < ApplicationRecord
  # relation
  belongs_to :user
  belongs_to :restaurant

  # validation
  validates :user_id, uniqueness: { scope: :restaurant_id }
end
