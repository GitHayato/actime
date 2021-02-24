Rails.application.routes.draw do
  devise_for :users
  
  root to: "top_pages#index"
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :watches, only: [:index, :new, :create, :edit, :update]
    resources :messages, only:[:index, :create, :destroy]
  end
  resources :top_pages, only: [:index]
end