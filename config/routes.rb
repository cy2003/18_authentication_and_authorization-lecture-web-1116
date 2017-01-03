Rails.application.routes.draw do
  resources :tweets, only: [:index, :show, :new, :create]
end
