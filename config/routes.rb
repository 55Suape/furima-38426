Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # itemsに紐づくorderのネスト
  resources :items do
   resources :orders, only: [:index, :create]
  end
end
