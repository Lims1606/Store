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
end
