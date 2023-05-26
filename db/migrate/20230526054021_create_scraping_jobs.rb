class CreateScrapingJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :scraping_jobs, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.text :href
      t.text :selector
      t.text :description
      t.string :cron_schedule

      t.timestamps
    end
  end
end
