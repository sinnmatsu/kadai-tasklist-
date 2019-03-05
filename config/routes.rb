Rails.application.routes.draw do
  
 

  # CRUD
 resources :tasks
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :new, :create]
 
 root to: 'tasks#index'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
end