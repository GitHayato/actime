Rails.application.routes.draw do
  devise_for :users
  
  resources :watches, only: [:index, :new, :create]
  resources :rooms, only: [:new, :create]
  resources :top_pages, only: [:index]
end
