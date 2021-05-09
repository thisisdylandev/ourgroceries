json.extract! grocery_list, :id, :user_id, :name, :created_at, :updated_at
json.url grocery_list_url(grocery_list, format: :json)
