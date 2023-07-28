Rails.application.routes.draw do
  root 'users#index'
  get 'users/:user_id/posts', to: 'posts#index'
  get 'users/:user_id/posts/new', to: 'posts#new'
  get 'users/:user_id/posts/:id', to: 'posts#show'
  get 'users/:user_id/posts/:id/comment', to: 'comment#new'
  get 'users/:user_id/posts/:id/like', to: 'like#new'
  get 'users/:id', to: 'users#show'
  get 'users', to: 'users#index'
  post '/posts' => 'posts#create', :as => :create_form
  post '/comment' => 'comment#create', :as => :create_commentF
  post '/like' => 'like#create', :as => :create_likeF

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end