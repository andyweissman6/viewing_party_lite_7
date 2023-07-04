Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show', as: "user"
end
