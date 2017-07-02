class CreateRestaurantFoods < ActiveRecord::Migration[4.2]
  def change
    create_table :restaurant_foods do |t|
      t.float :cost
      t.belongs_to :review, index: true
      t.belongs_to :restaurant, index: true
      t.belongs_to :food, index: true
      t.timestamps
    end
  end
end
