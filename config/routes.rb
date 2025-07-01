Rails.application.routes.draw do
  resources :articles, :users, :products

  root "articles#index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/users/:id", to: "users#show"
  get "/users/:id", to: "users#show", as: "user"
end
