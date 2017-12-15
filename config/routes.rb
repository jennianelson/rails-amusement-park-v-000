Rails.application.routes.draw do
  # get 'attractions/index'
  root 'welcome#home'

  resources :users
  resources :attractions
  resources :rides, only: [:create]
  
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end