require "test_helper"

class ScrapingJobHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraping_job_history = scraping_job_histories(:one)
  end

  test "should get index" do
    get scraping_job_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_scraping_job_history_url
    assert_response :success
  end

  test "should create scraping_job_history" do
    assert_difference("ScrapingJobHistory.count") do
      post scraping_job_histories_url, params: { scraping_job_history: { content: @scraping_job_history.content, ended_at: @scraping_job_history.ended_at, scraping_job_id: @scraping_job_history.scraping_job_id, started_at: @scraping_job_history.started_at, successful: @scraping_job_history.successful } }
    end

    assert_redirected_to scraping_job_history_url(ScrapingJobHistory.last)
  end

  test "should show scraping_job_history" do
    get scraping_job_history_url(@scraping_job_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraping_job_history_url(@scraping_job_history)
    assert_response :success
  end

  test "should update scraping_job_history" do
    patch scraping_job_history_url(@scraping_job_history), params: { scraping_job_history: { content: @scraping_job_history.content, ended_at: @scraping_job_history.ended_at, scraping_job_id: @scraping_job_history.scraping_job_id, started_at: @scraping_job_history.started_at, successful: @scraping_job_history.successful } }
    assert_redirected_to scraping_job_history_url(@scraping_job_history)
  end

  test "should destroy scraping_job_history" do
    assert_difference("ScrapingJobHistory.count", -1) do
      delete scraping_job_history_url(@scraping_job_history)
    end

    assert_redirected_to scraping_job_histories_url
  end
end
