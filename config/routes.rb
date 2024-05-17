Rails.application.routes.draw do
  root 'pages#login'

  get '/dashboard', to: 'pages#dashboard'
  get '/expenses', to: 'pages#expenses'
  post '/login', to: 'pages#create', as: 'login_session'
  delete '/logout', to: 'pages#destroy', as: 'logout'

  resources :workers, except: [:show]
  resources :clients
end
