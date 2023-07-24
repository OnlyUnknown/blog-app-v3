Rails.application.routes.draw do
  get 'posts/show'
  get 'posts/index'
  get 'users/show'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
