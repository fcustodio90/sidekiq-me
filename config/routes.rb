require "sidekiq/web"
Sidekiq::Web.app_url = "/"

Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Sidekiq::Web => "/sidekiq"
end
