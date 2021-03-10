Rails.application.routes.draw do
  devise_for :users
  
  root to: "top_pages#index"
  resources :users, only: [:show, :destroy] do
    member do
      get 'following'
      get 'follower'
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :watches, only: [:new, :create, :edit, :update]
    resources :messages, only:[:index, :create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end