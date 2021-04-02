Rails.application.routes.draw do
  devise_for :users
  
  root to: "top_pages#index"
  resources :users, only: [:show, :destroy] do
    member do
      get 'following'
      get 'follower'
    end
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :watches, only: [:index, :new, :create, :edit, :update]
    resources :messages, only:[:index, :create, :destroy]
    resources :distances, only: [:create]
    resources :events, only: [:create]
  end
  resources :relationships, only: [:create, :destroy]
end