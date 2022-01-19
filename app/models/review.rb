class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, numericality: {
    only_integer: true,greater_than_or_equal_to: 0, less_than_or_equal_to: 5,
    message: "%{value} is not between 0 and 5"
  }
end
