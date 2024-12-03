Rails.application.routes.draw do

  root "shops#index"

  get 'shops/index'
  get 'suppliers/order_index', to: 'suppliers#order_index'
  get 'buys/order_index', to: 'buys#order_index'
  get 'customers/order_index', to: 'customers#order_index'
  get 'sells/order_index', to: 'sells#order_index'

  devise_for :users
  resources :users, only: :show

  resources :categories do
    get 'items', to: 'categories#items'
  end

  resources :items do
    member do
      get 'details'
    end
  end
  resources :suppliers do
    resources :buys
  end
  resources :customers do
    resources :sells
  end
end