class ScrapingJob < ApplicationRecord
  belongs_to :user
  after_save :update_schedule
  after_destroy :remove_schedule

  def update_schedule
    Sidekiq::Scheduler.set_schedule(
      "ScraperWorker_#{id}", 
      { 
        'class' => 'ScraperWorker', 
        'args' => [id],
        'cron' => cron_schedule,
        'enabled' => true
      }
    )
  end

  def remove_schedule
    Sidekiq::Scheduler.remove_schedule("ScraperWorker_#{id}")
  end
end
