class ScrapingJobsController < ApplicationController
  before_action :set_scraping_job, only: %i[ show edit update destroy ]

  # GET /scraping_jobs or /scraping_jobs.json
  def index
    @scraping_jobs = ScrapingJob.all
  end

  # GET /scraping_jobs/1 or /scraping_jobs/1.json
  def show
  end

  # GET /scraping_jobs/new
  def new
    @scraping_job = ScrapingJob.new
  end

  # GET /scraping_jobs/1/edit
  def edit
  end

  # POST /scraping_jobs or /scraping_jobs.json
  def create
    @scraping_job = ScrapingJob.new(scraping_job_params)

    respond_to do |format|
      if @scraping_job.save
        format.html { redirect_to scraping_job_url(@scraping_job), notice: "Scraping job was successfully created." }
        format.json { render :show, status: :created, location: @scraping_job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scraping_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraping_jobs/1 or /scraping_jobs/1.json
  def update
    respond_to do |format|
      if @scraping_job.update(scraping_job_params)
        format.html { redirect_to scraping_job_url(@scraping_job), notice: "Scraping job was successfully updated." }
        format.json { render :show, status: :ok, location: @scraping_job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scraping_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraping_jobs/1 or /scraping_jobs/1.json
  def destroy
    @scraping_job.destroy

    respond_to do |format|
      format.html { redirect_to scraping_jobs_url, notice: "Scraping job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_job
      @scraping_job = ScrapingJob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scraping_job_params
      params.require(:scraping_job).permit(:user_id, :href, :selector, :description, :cron_schedule)
    end
end
