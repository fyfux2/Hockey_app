Rails.application.routes.draw do

  #get '/teams', to: 'teams#index'
  
  resources :teams
  resources :scores
  resources :players


  root 'scores#index'
end
