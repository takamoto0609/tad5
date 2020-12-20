Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :areas
  resources :items do
    collection do
      get 'order'
      get 'check_order'
      get 'crash_order'
      get 'receive_order'
      get 'approval_order'
      get 'my_store'
    end
    resources :chats
  end
  resources :wallets do
    collection do
      get 'check_receipts'
    end
  end
  resources :orders
  resources :menus do
    collection do
      get 'give'
      get 'take'
      get 'point'
      get 'how_to_use'
    end
  end
end
