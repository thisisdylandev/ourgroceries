# frozen_string_literal: true

class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :grocery_items, dependent: :delete_all
  has_many :user_grocery_lists, dependent: :delete_all
  has_many :invitations, dependent: :delete_all

  broadcasts_to ->(_c) { 'grocery_lists' }, inserts_by: :append, target: 'grocery_lists'

  validates :name, presence: true
end
