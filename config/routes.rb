Rails.application.routes.draw do

  get '/teams', to: 'teams#index'
  get 'teams/:id', to: 'teams#show'
end
