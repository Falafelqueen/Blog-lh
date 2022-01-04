Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'articles', to: "articles#index"
  get 'article/:id', to: "articles#show", as: :article
  get 'articles/new', to: "articles#new"
  post 'articles', to: "articles#create"
  get 'article/:id/edit', to: "articles#edit", as: :edit_article
  patch 'article/:id', to: "articles#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'pages#home'
  get 'signup', to: "users#new"
  post 'users', to: "users#create"
  get "user/:id", to: "users#show", as: :user
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
