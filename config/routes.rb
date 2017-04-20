Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, except: [:edit, :update, :destroy] do
    resources :burgers, only: [:index, :new, :create]
  end
  resources :burgers, only: [:index, :show]
  root 'static_pages#index'
end
