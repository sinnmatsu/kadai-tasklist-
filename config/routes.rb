Rails.application.routes.draw do
  
 

  # CRUD
 resources :tasks
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :new, :create]
 
 root to: 'tasks#index'
 #まずはrootでtasksにアクセスする
 
 get 'login', to: 'sessions#new'
 #login_pathというURLを作成し、session#newと紐ずける
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
end