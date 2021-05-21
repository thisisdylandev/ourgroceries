# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'main#index'
  resources :grocery_lists do
    resources :grocery_items
    resources :invitations
  end

  devise_for :users, controllers: {
    passwords: 'passwords'
  }
end
