Rails.application.routes.draw do
  get 'books/index'
  get 'books/new'
  post 'books/create', to: 'books#create'

  root 'books#index'
end
