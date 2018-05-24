Rails.application.routes.draw do
  #routes for my controller has been initialized here -> two controller: address, version
  resources :address
  resources :version
  put '/address/rollback/:id', to: 'address#rollback'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
