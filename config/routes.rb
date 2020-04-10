Rails.application.routes.draw do
  get 'books/index'
  get 'books/top'
  get 'books/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
