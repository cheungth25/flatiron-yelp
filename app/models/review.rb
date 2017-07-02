class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  has_one :restaurant_food
end
