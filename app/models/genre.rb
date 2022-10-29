class Genre < ApplicationRecord
  # relation
  has_many :restaurants
end
