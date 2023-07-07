Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  
  get '/users/:user_id', to: 'users#show', as: :dashboard
  get '/users/:user_id/discover', to: 'discover#index', as: :discover
  get '/users/:user_id/movies', to: 'movies#index', as: :user_movies
end
