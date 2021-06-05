Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :purchase_info, only: [:create, :index]
  end

  resources :items do
    resources :messages, only: :create
  end

end
