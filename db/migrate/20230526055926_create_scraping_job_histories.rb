class CreateScrapingJobHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :scraping_job_histories, id: :uuid do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.boolean :successful
      t.text :content
      t.references :scraping_job, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
