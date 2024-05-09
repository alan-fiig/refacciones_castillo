Rails.application.routes.draw do
  root 'pages#home'
  get '/dashboard', to: 'pages#dashboard'

  get '/client', to: 'pages#client'

  resources :workers, except: [:show]


  get '/pay', to: 'pages#pay'

end
