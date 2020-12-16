Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :areas
  resources :items
  resources :wallets do
  collection do
    get 'check_receipts'
  end
end
end
