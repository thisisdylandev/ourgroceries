# frozen_string_literal: true

class GroceryItem < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :user

  broadcasts_to :grocery_list

  validates :name, presence: true
  validates :amount, presence: true
end
