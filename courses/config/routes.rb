Rails.application.routes.draw do
  # root"categories#index" 
  get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/delete"
  get "categories/edit"
  get "categories/create"
  post "categories/remove"
  post "categories/update"

  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/edit'
  get 'pages/delete'
end
