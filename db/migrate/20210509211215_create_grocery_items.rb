class CreateGroceryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_items do |t|
      t.belongs_to :grocery_list, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.integer :amount
      t.boolean :active

      t.timestamps
    end
  end
end
