Rails.application.routes.draw do
  


  # Root is the unauthenticated path
  root 'sessions#unauth'

  # Sessions URL
  get 'sessions/unauth', as: :login
  post 'sessions/login', as: :signin
  delete 'sessions/logout', as: :logout

  # Resourceful routes for posts
  resources :posts
  get '/interests', to: 'posts#my_interests', as: 'interests'
  post '/posts/:id/comment', to: 'posts#comment', as: 'comment_on_post'
  # Resourceful routes for users
  resources :users, only: [:create, :new, :update, :destroy, :edit]


end
