Rails.application.routes.draw do
  get '/encryptions/new', to: 'encryptions#new'
  post '/encryptions', to: 'encryptions#create'
  get '/encryptions/:id', to: 'encryptions#show'
  delete '/encryptions/:id', to: 'encryptions#destroy'
  get '/encryptions/:id/confirmation', to: 'encryptions#confirmation'
  # resources :encryptions, only: [:new]

  get '/decryptions/new', to: 'decryptions#new'
  post '/decryptions', to: 'decryptions#create'
  get '/decryptions/:id', to: 'decryptions#show'
  delete '/decryptions/:id', to: 'decryptions#destroy'
  get '/decryptions/:id/confirmation', to: 'decryptions#confirmation'
  # resources :decryptions, only: [:new]

  get '/cracks/new', to: 'cracks#new'
  post '/cracks', to: 'cracks#create'
  get '/cracks/:id', to: 'cracks#show'
  delete '/cracks/:id', to: 'cracks#destroy'
  get '/cracks/:id/confirmation', to: 'cracks#confirmation'
  # resources :cracks, only: [:new]
end
