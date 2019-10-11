Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepages#index'
  
  resources :homepages, only: [:index]
  
  resources :drivers
  patch '/drivers/:id/status', to: 'drivers#set_status', as: 'set_status'
  
  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips
end