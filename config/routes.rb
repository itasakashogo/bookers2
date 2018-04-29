Rails.application.routes.draw do
  devise_for :users
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root to: 'books#root'
  resources :users, only:[:show, :edit, :update, :index, :delete]

  get 'books' => 'book#index'
  get '/books/:id/edit' => 'posts#edit', as: 'edit_post'
  get '/books/:id' => 'books#show', as: 'book1'
  delete '/books/:id' => 'books#destroy', as: 'destroy_book'


end

