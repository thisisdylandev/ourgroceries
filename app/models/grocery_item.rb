class GroceryItem < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :user
end
