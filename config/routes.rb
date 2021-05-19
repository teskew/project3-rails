Rails.application.routes.draw do
  root to: 'application#home'

   get '/signup', to: 'users#new'
   post '/signup', to: 'users#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
   get '/auth/:provider/callback', to: 'sessions#omniauth'
 
  

  resources :users do
    resources :companies
  end
  resources :orders, only: [:index, :new, :create]
  resources :companies  do

    resources :orders, shallow: true  
  end
  
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   #signed up
  
end
