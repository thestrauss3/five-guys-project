Rails.application.routes.draw do
  resources :restaurants, except: [:edit, :update, :destroy] do
    resources :burgers, only: [:index, :new, :create]
  end
  root 'static_pages#index'
  resources :burgers, only: [:index, :show]
end
