Rails.application.routes.draw do
  devise_for :users
  
  resources :watches, only: [:index, :new, :create]
  resources :threads, only: [:index]
end
