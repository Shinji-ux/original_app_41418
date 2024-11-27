Rails.application.routes.draw do
  get 'shops/index'
  devise_for :users
  resources :users do
    resources :items
    resources :suppliers do
      resources :supplier_records
    end
    resources :customers do
      resources :customer_records
    end
  end
  root "shops#index"
end
