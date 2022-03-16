Rails.application.routes.draw do
  get '/encryptions/new', to: 'encryptions#new'
  post '/encryptions/new', to: 'encryptions#create'
  get '/encryptions/:id', to: 'encryptions#show'
  delete '/encryptions/:id', to: 'encryptions#destroy'
  get '/encryptions/:id/confirmation', to: 'encryptions#confirmation'
  # resources :encryptions, only:[:new, :create, :show, :destroy, :confirmation]

  get '/decryptions/new', to: 'decryptions#new'
  post '/decryptions/new', to: 'decryptions#create'
  get '/decryptions/:id', to: 'decryptions#show'
  delete '/decryptions/:id', to: 'decryptions#destroy'
  get '/decryptions/:id/confirmation', to: 'decryptions#confirmation'
  # resources :encryptions, only:[:new, :create, :show, :destroy, :confirmation]

  get '/cracks/new', to: 'cracks#new'
  post '/cracks/new', to: 'cracks#create'
  get '/cracks/:id', to: 'cracks#show'
  delete '/cracks/:id', to: 'cracks#destroy'
  get '/cracks/:id/confirmation', to: 'cracks#confirmation'
end
