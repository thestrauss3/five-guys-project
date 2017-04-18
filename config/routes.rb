Rails.application.routes.draw do
  resources :restaurants, only: [:new, :index, :create, :show, :destroy, :edit]
  root 'static_pages#index'
end
