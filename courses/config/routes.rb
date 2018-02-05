Rails.application.routes.draw do
  # root"categories#index" 
  get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/create"
  get "categories/delete"
  post "categories/remove"
  get "categories/edit"
  post "categories/update"

  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/create'
  get 'pages/edit'
  post 'pages/update'
  get 'pages/delete'
  post 'pages/remove'

  get 'articles/index'
  get 'articles/new'
  post 'articles/create'
  get 'articles/edit'
  get 'articles/delete'
  get 'articles/show'
end
