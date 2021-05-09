json.extract! user_grocery_list, :id, :user_id, :grocery_list_id, :created_at, :updated_at
json.url user_grocery_list_url(user_grocery_list, format: :json)
