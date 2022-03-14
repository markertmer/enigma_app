Rails.application.routes.draw do
  get '/encryptions/new', to: 'encryptions#new'
  post '/encryptions/new', to: 'encryptions#create'
  get '/encryptions/:id', to: 'encryptions#show'
end
