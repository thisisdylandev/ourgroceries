Rails.application.routes.draw do
  root to: "main#index"
  resources :user_grocery_lists
  resources :grocery_lists do
    resources :grocery_items
    resources :invitations
  end

  devise_for :users, controllers: {
    passwords: 'passwords'
  }
end
