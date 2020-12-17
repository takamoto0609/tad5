Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :areas
  resources :items do
    collection do
      get 'order'
      get 'check_order'
    end
  end
  resources :wallets do
    collection do
      get 'check_receipts'
    end
  end
  resources :orders
end
