Rails.application.routes.draw do
  root to: 'application#home'

   get '/signup', to: 'users#new'
   post '/signup', to: 'users#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

 
  resources :orders

  resources :users do
    resources :companies, only: [:new, :create, :index ]
  end
  
  
  resources :companies do
    resources :orders, only: [:new, :create, :index]
  end
  

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   #signed up
  

