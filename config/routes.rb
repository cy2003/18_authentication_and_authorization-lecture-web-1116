Rails.application.routes.draw do
  resources :tweets, except: [:destroy]
end
