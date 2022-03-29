Rails.application.routes.draw do

  get '/teams', to: 'teams#index'
  get '/teams/new', to: 'teams#new'
  get '/teams/:id', to: 'teams#show'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  get '/teams/:id/players/new', to: 'players#new'
  get '/teams/:id/players', to: 'teams#players'
  post '/teams', to: 'teams#create'
  get '/teams/:id/edit', to: 'teams#edit'
  patch '/teams/:id', to: 'teams#update'
  post '/teams/:id/players', to: 'players#create'
  get '/players/:id/edit', to: 'players#edit'
  patch '/players/:id', to: 'players#update'
end
