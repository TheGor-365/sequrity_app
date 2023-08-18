Rails.application.routes.draw do
  root "users#index"
  resources :posts
  resources :users
end
