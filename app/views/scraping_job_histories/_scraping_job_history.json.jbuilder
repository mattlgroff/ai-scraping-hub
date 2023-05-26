json.extract! scraping_job_history, :id, :started_at, :ended_at, :successful, :content, :scraping_job_id, :created_at, :updated_at
json.url scraping_job_history_url(scraping_job_history, format: :json)
