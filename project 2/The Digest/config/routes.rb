Rails.application.routes.draw do
  
  # Root is the unauthenticated path
  root 'sessions#unauth'

  # Sessions URL
  get 'sessions/unauth', to: 'sessions#unauth', as: :login
  post 'sessions/login', as: :signin
  delete 'sessions/logout', as: :logout

  # Resourceful routes for articles
  resources :articles
  get '/interests', to: 'articles#my_interests', as: 'interests'
  get '/fetch', to: 'articles#fetchNews', as:'fetch'
  resources :users, only: [:create,:new,:update,:destroy,:edit]
end
