Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepages#index'


  resources :passengers do
    resources :trips, only: [ :new]
  end
  
  
  resources :passengers
  resources :drivers
  resources :trips
  resources :homepages, only: [:index]
  
end
