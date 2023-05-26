Rails.application.routes.draw do
  resources :users
  resources :scraping_jobs do
    get 'latest_content', on: :member
  end
  resources :scraping_job_histories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
