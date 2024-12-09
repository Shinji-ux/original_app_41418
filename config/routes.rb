Rails.application.routes.draw do

  root "shops#index"

  get 'shops/index'
  get 'suppliers/order_index', to: 'suppliers#order_index'
  get 'buys/order_index', to: 'buys#order_index'
  get 'buys/search', to: 'buys#search'
  get 'buys/search_result', to: 'buys#search_result'
  get 'buys/issue_receipt', to: 'buys#issue_receipt'
  get 'buys/receipt', to: 'buys#receipt'
  get 'customers/order_index', to: 'customers#order_index'
  get 'sells/order_index', to: 'sells#order_index'
  get 'sells/search', to: 'sells#search'
  get 'sells/search_result', to: 'sells#search_result'
  get 'sells/issue_receipt', to: 'sells#issue_receipt'
  get 'sells/receipt', to: 'sells#receipt'
  get 'items/search', to: 'items#search'
  get 'items/buy_receipt', to: 'items#buy_receipt'
  get 'items/sell_receipt', to: 'items#sell_receipt'
  get 'categories/search', to: 'categories#search'
  get 'categories/buy_receipt', to: 'categories#buy_receipt'
  get 'categories/sell_receipt', to: 'categories#sell_receipt'


  devise_for :users
  resources :users, only: :show

  resources :categories do
    get 'items', to: 'categories#items'
    collection do
      post 'import', to: 'categories#import'
    end
  end

  resources :items do
    member do
      get 'details'
    end
    collection do
      post 'import'
    end
  end
  resources :suppliers do
    collection do
      post 'import'
    end
    resources :buys do
    end
  end
  resources :customers do
    collection do
      post 'import'
    end
    resources :sells do
    end
  end
end