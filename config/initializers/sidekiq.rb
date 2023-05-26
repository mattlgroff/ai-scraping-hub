require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }

  config.on(:startup) do
    ScrapingJob.find_each do |scraping_job|
      Sidekiq::Scheduler.set_schedule(
        "ScraperWorker_#{scraping_job.id}", 
        { 
          'class' => 'ScraperWorker', 
          'args' => [scraping_job.id],
          'cron' => scraping_job.cron_schedule,
          'enabled' => true
        }
      )
    end
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end
