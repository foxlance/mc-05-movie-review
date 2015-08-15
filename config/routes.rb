Rails.application.routes.draw do
  
  resources :movies do
  	resources :reviews, except: [:show, :index]
  end
  
  devise_for :users
  
  root 'movies#index'
end
