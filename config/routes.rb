Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/new'
  get 'buys/index'
  get 'buys/new'
  get 'buys/create'
  get 'shops/index'
  devise_for :users
  resources :users do
    resources :items
  end
  resources :suppliers do
    resources :buys
  end
  resources :customers do
    resources :sells
  end
  root "shops#index"
end