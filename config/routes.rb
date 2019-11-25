# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'product/index'
  get 'product/show'
  get 'categories/index'
  get 'categories/show'
  get 'brands/index'
  get 'brands/show'
  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  get 'store/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'store#index'
end
