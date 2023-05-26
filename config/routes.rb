Rails.application.routes.draw do
  resources :scraping_job_histories
  resources :scraping_jobs
  resources :users
  resources :scraping_jobs do
    get 'latest_content', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
