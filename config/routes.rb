Rails.application.routes.draw do
  get 'shops/index'
  devise_for :users
  resources :users do
    resources :items
  end
  resources :categories
  resources :suppliers do
    resources :buys
  end
  resources :customers do
    resources :sells
  end
  root "shops#index"
end