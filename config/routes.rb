Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'

  get '/register', to: 'users#new', as: :new_user
  post '/register', to: 'users#create'
  
  get '/users/:user_id', to: 'users#show', as: :dashboard
  get '/users/:user_id/discover', to: 'discover#index', as: :discover
  get '/users/:user_id/movies', to: 'movies#index', as: :user_movies

  get '/users/:user_id/movies/:movie_id', to: 'movies#show', as: :user_movie
  get '/users/:user_id/movies/:movie_id/party/new', to: 'parties#new', as: :new_party

end
