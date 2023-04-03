Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #!original should uncomment the links below...
  # resources :users, only: [:show]

  #! Defines test routes for users actions... delete after exercise
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:user_id/posts', to: 'users#user_posts', as: 'user_posts'
  get 'users/:id/posts/:post_id', to: 'users#post_details', as: 'user_post'



  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index', as: 'users'
end
