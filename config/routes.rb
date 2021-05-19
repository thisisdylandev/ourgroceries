Rails.application.routes.draw do
  root to: "main#index"
  resources :user_grocery_lists
  resources :grocery_lists do
    resources :grocery_items
    resources :invitations
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
