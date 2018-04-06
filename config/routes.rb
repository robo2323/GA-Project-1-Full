# == Route Map
#
#      Prefix Verb   URI Pattern                 Controller#Action
#        root GET    /                           presets#index
#       users POST   /users(.:format)            users#create
#    new_user GET    /users/new(.:format)        users#new
#   edit_user GET    /users/:id/edit(.:format)   users#edit
#        user GET    /users/:id(.:format)        users#show
#             PATCH  /users/:id(.:format)        users#update
#             PUT    /users/:id(.:format)        users#update
#             DELETE /users/:id(.:format)        users#destroy
# presets_all GET    /presets/all(.:format)      presets#all
#     presets GET    /presets(.:format)          presets#index
#             POST   /presets(.:format)          presets#create
#  new_preset GET    /presets/new(.:format)      presets#new
# edit_preset GET    /presets/:id/edit(.:format) presets#edit
#      preset GET    /presets/:id(.:format)      presets#show
#             PATCH  /presets/:id(.:format)      presets#update
#             PUT    /presets/:id(.:format)      presets#update
#             DELETE /presets/:id(.:format)      presets#destroy
#    comments POST   /comments(.:format)         comments#create
#     comment PATCH  /comments/:id(.:format)     comments#update
#             PUT    /comments/:id(.:format)     comments#update
#             DELETE /comments/:id(.:format)     comments#destroy
#     ratings POST   /ratings(.:format)          ratings#create
#      rating PATCH  /ratings/:id(.:format)      ratings#update
#             PUT    /ratings/:id(.:format)      ratings#update
#             DELETE /ratings/:id(.:format)      ratings#destroy
#       login GET    /login(.:format)            session#new
#             POST   /login(.:format)            session#create
#             DELETE /login(.:format)            session#destroy
# 

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
