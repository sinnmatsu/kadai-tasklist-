Rails.application.routes.draw do
  
  root to: 'tasks#index'
  # CRUD
 resources :tasks
end