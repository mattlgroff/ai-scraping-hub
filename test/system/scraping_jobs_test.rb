require "application_system_test_case"

class ScrapingJobsTest < ApplicationSystemTestCase
  setup do
    @scraping_job = scraping_jobs(:one)
  end

  test "visiting the index" do
    visit scraping_jobs_url
    assert_selector "h1", text: "Scraping jobs"
  end

  test "should create scraping job" do
    visit scraping_jobs_url
    click_on "New scraping job"

    fill_in "Cron schedule", with: @scraping_job.cron_schedule
    fill_in "Description", with: @scraping_job.description
    fill_in "Href", with: @scraping_job.href
    fill_in "Selector", with: @scraping_job.selector
    fill_in "User", with: @scraping_job.user_id
    click_on "Create Scraping job"

    assert_text "Scraping job was successfully created"
    click_on "Back"
  end

  test "should update Scraping job" do
    visit scraping_job_url(@scraping_job)
    click_on "Edit this scraping job", match: :first

    fill_in "Cron schedule", with: @scraping_job.cron_schedule
    fill_in "Description", with: @scraping_job.description
    fill_in "Href", with: @scraping_job.href
    fill_in "Selector", with: @scraping_job.selector
    fill_in "User", with: @scraping_job.user_id
    click_on "Update Scraping job"

    assert_text "Scraping job was successfully updated"
    click_on "Back"
  end

  test "should destroy Scraping job" do
    visit scraping_job_url(@scraping_job)
    click_on "Destroy this scraping job", match: :first

    assert_text "Scraping job was successfully destroyed"
  end
end
