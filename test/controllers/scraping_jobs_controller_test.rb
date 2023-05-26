require "test_helper"

class ScrapingJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraping_job = scraping_jobs(:one)
  end

  test "should get index" do
    get scraping_jobs_url
    assert_response :success
  end

  test "should get new" do
    get new_scraping_job_url
    assert_response :success
  end

  test "should create scraping_job" do
    assert_difference("ScrapingJob.count") do
      post scraping_jobs_url, params: { scraping_job: { cron_schedule: @scraping_job.cron_schedule, description: @scraping_job.description, href: @scraping_job.href, selector: @scraping_job.selector, user_id: @scraping_job.user_id } }
    end

    assert_redirected_to scraping_job_url(ScrapingJob.last)
  end

  test "should show scraping_job" do
    get scraping_job_url(@scraping_job)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraping_job_url(@scraping_job)
    assert_response :success
  end

  test "should update scraping_job" do
    patch scraping_job_url(@scraping_job), params: { scraping_job: { cron_schedule: @scraping_job.cron_schedule, description: @scraping_job.description, href: @scraping_job.href, selector: @scraping_job.selector, user_id: @scraping_job.user_id } }
    assert_redirected_to scraping_job_url(@scraping_job)
  end

  test "should destroy scraping_job" do
    assert_difference("ScrapingJob.count", -1) do
      delete scraping_job_url(@scraping_job)
    end

    assert_redirected_to scraping_jobs_url
  end
end
