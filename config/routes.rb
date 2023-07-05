Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/users/:user_id', to: 'users#show', as: :dashboard
  get '/users/:user_id/discover', to: 'discover#index', as: :discover
end
