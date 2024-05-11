Rails.application.routes.draw do
  root 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/pay', to: 'pages#pay'

  resources :workers, except: [:show]
  resources :clients
end
