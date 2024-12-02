Rails.application.routes.draw do

  root "shops#index"
  get 'shops/index'
  get 'suppliers/order_index', to: 'suppliers#order_index'
  get 'buys/order_index', to: 'buys#order_index'

  devise_for :users
  resources :users, only: :show
  resources :categories
  resources :items
  resources :suppliers do
    resources :buys
  end
  resources :customers do
    resources :sells
  end
end