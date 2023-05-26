json.extract! scraping_job, :id, :user_id, :href, :selector, :description, :cron_schedule, :created_at, :updated_at
json.url scraping_job_url(scraping_job, format: :json)
