Rails.application.routes.draw do
  resources :articles, :products
  resources :users do
  resources :posts
  end
  resource :geocoder

  root "articles#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
