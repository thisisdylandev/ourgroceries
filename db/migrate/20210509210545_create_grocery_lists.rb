# frozen_string_literal: true

class CreateGroceryLists < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_lists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
