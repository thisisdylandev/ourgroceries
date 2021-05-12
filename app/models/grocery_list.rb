class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :grocery_items
  has_many :user_grocery_lists

  broadcasts_to ->(c) { "grocery_lists" }, inserts_by: :append, target: "grocery_lists"

  validates :name, presence: true
end
