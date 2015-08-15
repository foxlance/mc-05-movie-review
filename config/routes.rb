Rails.application.routes.draw do
  
  resources :movies do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index]
  end
  
  devise_for :users
  
  root 'movies#index'
end
