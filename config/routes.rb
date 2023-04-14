Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/users/sign_in')
  
  delete 'posts/:id', to: 'posts#destroy', as: :delete_post
  delete 'posts/:post_id/comments/:id', to: 'comments#destroy', as: :delete_comment

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
        resources :likes, only: [:new, :create]
    end
  end
end

