Rails.application.routes.draw do
  get 'shops/index'
  get 'items/filter_by_category', to: 'items#filter_by_category'
  devise_for :users
  resources :users do
    resources :items do
      get :filter_by_category
    end
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