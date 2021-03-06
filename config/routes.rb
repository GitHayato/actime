Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: "top_pages#index"
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get 'following'
      get 'follower'
    end
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:new, :create, :destroy, :edit, :update] do
    resources :watches, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :messages, only:[:index, :create, :destroy]
    resources :distances, only: [:create]
    resources :events, only: [:create]
  end
  resources :relationships, only: [:create, :destroy]

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end