Rails.application.routes.draw do
  resources :scraping_job_histories
  resources :scraping_jobs
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'  

  # Defines the root path route ("/")
  root 'home#index'
end
