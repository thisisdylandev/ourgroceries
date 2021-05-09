class CreateUserGroceryLists < ActiveRecord::Migration[6.1]
  def change
    create_table :user_grocery_lists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :grocery_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
