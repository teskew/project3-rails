Rails.application.routes.draw do
  root to: 'sessions#home'

   get '/signup', to: 'users#new'
   post '/signup', to: 'users#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

 
  

  resources :users do
    resources :companies
  end
  
  resources :companies  do
    resources :orders, shallow: true
  end
  
  resources :orders, only: [:index, :new, :create]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   #signed up
  
end
