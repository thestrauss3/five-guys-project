Rails.application.routes.draw do
  root 'static_pages#index'
  resources :burgers, only: [:index, :show, :new, :create]
end
