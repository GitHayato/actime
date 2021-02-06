Rails.application.routes.draw do
  devise_for :users
  
  root to: "top_pages#index"
  resources :watches, only: [:index, :new, :create]
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only:[:index, :create]
  end
  resources :top_pages, only: [:index]
end
