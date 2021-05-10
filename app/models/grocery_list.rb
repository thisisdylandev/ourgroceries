class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :grocery_items
  has_many :user_grocery_lists
end
