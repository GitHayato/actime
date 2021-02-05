Rails.application.routes.draw do
  devise_for :users
  
  resources :watches, only: [:index, :new, :create]
  resources :rooms, only: [:new, :create] do
    resources :messages, only:[:index]
  end
  resources :top_pages, only: [:index]
end
