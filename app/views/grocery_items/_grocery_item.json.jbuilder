json.extract! grocery_item, :id, :grocery_list_id, :user_id, :name, :amount, :active, :created_at, :updated_at
json.url grocery_item_url(grocery_item, format: :json)
