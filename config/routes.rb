Rails.application.routes.draw do
  get '/encryptions/new', to: 'encryptions#new'
  post '/encryptions/new', to: 'encryptions#create'
  get '/encryptions/output', to: 'encryptions#output'
end
