Rails.application.routes.draw do
  root to: "main#index"
  resources :user_grocery_lists
  resources :grocery_items
  resources :grocery_lists
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
