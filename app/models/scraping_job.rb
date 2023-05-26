class ScrapingJob < ApplicationRecord
  belongs_to :user
  after_save :update_schedule
  after_destroy :remove_schedule

  def update_schedule
    SidekiqScheduler.set_schedule(
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
    SidekiqScheduler.remove_schedule("ScraperWorker_#{id}")
  end
end
