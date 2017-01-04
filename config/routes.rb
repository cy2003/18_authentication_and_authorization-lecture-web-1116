Rails.application.routes.draw do
  resources :tweets, except: [:destroy]

  get '/cookies', to: 'cookies#index'
  get '/cookies/:name', to: 'cookies#name'

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: 'logout'
end
