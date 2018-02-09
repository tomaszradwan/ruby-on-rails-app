Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/new'
  # get 'articles/edit'
  # get 'articles/delete'

  # get 'pages/index'
  # get 'pages/show'
  # get 'pages/new'
  # get 'pages/edit'
  # get 'pages/delete'

  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match ':controller(/:action(/:id))', :via => [:get, :post]
end
