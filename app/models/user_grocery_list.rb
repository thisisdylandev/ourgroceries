class UserGroceryList < ApplicationRecord
  belongs_to :user
  belongs_to :grocery_list
end
