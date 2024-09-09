# frozen_string_literal: true

Rails.application.routes.draw do
  resources :book_borrows
  resources :books
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'

  get '/member_dashboard', to: 'member_dashboard#index'
  get '/librarian_dashboard', to: 'librarian_dashboard#index'
end
