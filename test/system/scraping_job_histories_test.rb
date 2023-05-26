require "application_system_test_case"

class ScrapingJobHistoriesTest < ApplicationSystemTestCase
  setup do
    @scraping_job_history = scraping_job_histories(:one)
  end

  test "visiting the index" do
    visit scraping_job_histories_url
    assert_selector "h1", text: "Scraping job histories"
  end

  test "should create scraping job history" do
    visit scraping_job_histories_url
    click_on "New scraping job history"

    fill_in "Content", with: @scraping_job_history.content
    fill_in "Ended at", with: @scraping_job_history.ended_at
    fill_in "Scraping job", with: @scraping_job_history.scraping_job_id
    fill_in "Started at", with: @scraping_job_history.started_at
    check "Successful" if @scraping_job_history.successful
    click_on "Create Scraping job history"

    assert_text "Scraping job history was successfully created"
    click_on "Back"
  end

  test "should update Scraping job history" do
    visit scraping_job_history_url(@scraping_job_history)
    click_on "Edit this scraping job history", match: :first

    fill_in "Content", with: @scraping_job_history.content
    fill_in "Ended at", with: @scraping_job_history.ended_at
    fill_in "Scraping job", with: @scraping_job_history.scraping_job_id
    fill_in "Started at", with: @scraping_job_history.started_at
    check "Successful" if @scraping_job_history.successful
    click_on "Update Scraping job history"

    assert_text "Scraping job history was successfully updated"
    click_on "Back"
  end

  test "should destroy Scraping job history" do
    visit scraping_job_history_url(@scraping_job_history)
    click_on "Destroy this scraping job history", match: :first

    assert_text "Scraping job history was successfully destroyed"
  end
end
