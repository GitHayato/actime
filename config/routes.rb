Rails.application.routes.draw do
  devise_for :users
  
  resources :watches, only: [:index, :new, :create]
end
