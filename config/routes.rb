Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :alarms, only: [:index, :create]
  resources :upvotes, only: [:create]
  
end
