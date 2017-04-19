Rails.application.routes.draw do
  resources :users
  get '/signin', to: 'users#signin'

  resources :attractions

  post '/rides/:user_id/:attraction_id', to: 'rides#create', as: '/ride'

  root 'users#welcome'
end
