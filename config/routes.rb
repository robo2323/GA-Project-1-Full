Rails.application.routes.draw do
  root to: "presets#index"


  # resources :users

  resources :users, except: [:index]

  get 'presets/all', to: 'presets#all'

  resources :presets

  resources :comments, only: [:create, :update, :destroy]
  resources :ratings, only: [:create, :update, :destroy]


  # resources :users, only: [:new, :create]
  # see rails guide for routing, esp. nested routes

  get '/login', to: 'session#new' #sign in form
  post '/login', to: 'session#create' #sign in action
  delete '/login', to: 'session#destroy' #sign out
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
