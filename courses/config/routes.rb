Rails.application.routes.draw do
  root 'test#index'
  get 'test/hello'
  get 'test/navigation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
