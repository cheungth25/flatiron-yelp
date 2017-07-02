class RestaurantFood < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :food
  belongs_to :review
end
