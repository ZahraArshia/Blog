Rails.application.routes.draw do
  devise_for :users
  # get 'comments/new'
  # get 'likes/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
