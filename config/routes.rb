Rails.application.routes.draw do
  root to: "presets#index"

  resources :users, except: [:index]

  get 'presets/all', to: 'presets#all'

  resources :presets

  resources :comments, only: [:create, :update, :destroy]
  resources :ratings, only: [:create, :update, :destroy]


  get '/login', to: 'session#new' #sign in form
  post '/login', to: 'session#create' #sign in action
  delete '/login', to: 'session#destroy' #sign out

end
