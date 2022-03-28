Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  resources :encryptions, only: [:create, :new, :show, :destroy]
  get '/encryptions/:id/confirmation', to: 'encryptions#confirmation'

  resources :decryptions, only: [:create, :new, :show, :destroy]
  get '/decryptions/:id/confirmation', to: 'decryptions#confirmation'

  # resources :cracks, only: [:create, :new, :show, :destroy]
  # get '/cracks/:id/confirmation', to: 'cracks#confirmation'
end
