# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cards/show'

  get 'appointment/index'

  get 'appointment/show'

  get 'employees/index'

  get 'employees/show'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'

    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'

    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  get '/search' => 'store#search', :as => 'search_store'

  resource :cards, only: [:show]

  resources :line_items

  resources :carts

  get 'product/index'

  get 'product/show'

  get 'categories/index'

  get 'categories/show'

  get 'brands/index'

  get 'brands/show'

  post 'line_items/line_items'

  devise_for :users, controllers: {

    registrations: 'registrations'

  }

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  get 'store/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :brands, only: %i[index alphabetized show]

  resources :products, only: %i[index show] do
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
