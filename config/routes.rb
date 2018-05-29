Rails.application.routes.draw do
  resources :notices
  resources :transactions
  resources :comments
  resources :neighborhoods
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end