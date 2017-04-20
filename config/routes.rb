Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, except: [:edit, :update, :destroy] do
    resources :burgers, only: [:index, :new, :create]
  end

  root 'static_pages#index'
  resources :burgers, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show]
  post 'burgers' => 'burgers/new'
  post 'reviews' => 'reviews/new'
  post 'restaurants' => 'restaurants/new'

end
