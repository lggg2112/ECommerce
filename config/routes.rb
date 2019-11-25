# frozen_string_literal: true

Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'products/index'
  get 'products/show'
  get 'product/index'
  get 'product/show'
  get 'categories/index'
  get 'categories/show'
  get 'brands/index'
  get 'brands/show'

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'store/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :brands, only: %i[index alphabetized show]
  resources :products, only: %i[index alphabetized show] do
    collection do
      get 'search_results'
    end
  end
  resources :categories, only: %i[index alphabetized show] do
    collection do
      get 'search_results'
    end
  end

  root 'store#index'
end
