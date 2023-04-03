Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #!original should uncomment the links below...
  # resources :users, only: [:show]

  #! Defines test routes for users actions... delete after exercise
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get '/users/:id/posts/:post_id', to: 'posts#show', as: 'user_post'
  get '/users', to:'users#index', as: 'users'
  get '/users/:id', to: 'users#show', as: 'user'



  # Defines the root path route ("/")
  # root "articles#index"
  
end
