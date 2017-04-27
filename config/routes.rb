Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, except: [:edit, :update, :destroy] do
    resources :burgers, only: [:new, :create]
  end

  root 'static_pages#index'
  resources :burgers, only: [:index, :show , :destroy] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show]

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:edit, :update]
  end

  resources :searches, only: [:index]
  resources :admin, only: [:show]

  # post 'burgers' => 'burgers/new'
  # post 'reviews' => 'reviews/new'
  # post 'restaurants' => 'restaurants/new'
  namespace :api do
    namespace :v1 do
      resources :burgers
    end
  end

  namespace :api do
    namespace :v1 do
      resources :uservotes
    end
  end

  namespace :api do
    namespace :v1 do
      resources :upvotes, only: [:show]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :downvotes, only: [:show]
    end
  end

end
