Rails.application.routes.draw do
  resources :reviews
  resources :movies
  devise_for :users
  
  root 'movies#index'
end
