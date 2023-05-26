require 'net/http'
require 'uri'
require 'redis'

class ScraperWorker
  include Sidekiq::Worker

  def perform(scraping_job_id)
    scraping_job = ScrapingJob.find(scraping_job_id)

    # Prepare the URI and the request.
    uri = URI.parse(ENV['SCRAPER_API_URL'])
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Bearer #{ENV['SCRAPER_API_TOKEN']}"
    request.body = JSON.dump({
      "href" => scraping_job.href,
      "selector" => scraping_job.selector,
      "description" => scraping_job.description
    })

    # Set up the HTTP.
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    # Make the request and get the response.
    started_at = Time.now
    response = http.request(request)
    ended_at = Time.now

    # Do something with the response here...
    content = response.body
    successful = response.code == '200'

    # Create a new history record.
    history = ScrapingJobHistory.create!(
      started_at: started_at,
      ended_at: ended_at,
      successful: successful,
      content: content,
      scraping_job_id: scraping_job.id
    )

    # Store the content in Redis.
    redis = Redis.new(url: ENV['REDIS_URL'])
    redis.set(scraping_job.id, content)
  end
end
