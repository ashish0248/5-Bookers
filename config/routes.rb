Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/edit'
	devise_for :users

	root 'books#top'
	resources :books, only: [:create, :index, :show, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
