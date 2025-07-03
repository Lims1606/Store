Rails.application.routes.draw do
  concern :commentable do
    resources :comments
  end

  resources :articles, :products
  namespace :admin do
    resources :users do
      resources :posts, concerns: :commentable, shallow: true
    end
  end

  resource :geocoder
  root "articles#index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/users/:id", to: "users#show"
  get "/users", to: "users#index"
  post "/users", to: "users#create"
  get "/users/new", to: "users#new"
  get "/users/:id/edit", to: "users#edit"
  put "/users/:id", to: "users#update"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  resources :images do
    member do
      get "preview", to: "images#new"
    end
    collection do
      get "user_images"
    end
  end

  resources :user do
    resources :posts, except: [ :index, :edit ] do
      resources :comments
    end
  end

  resources :users, :comments, :posts
  resource :post
  get "/post", to: "post#show"
  post "/post", to: "post#create"
  get "/post/new", to: "post#new"
  get "/post/edit", to: "post#edit"
  put "/post", to: "post#update"
  delete "/post", to: "post#destroy"

  scope module: "user" do
   resources :comments
  end
end
