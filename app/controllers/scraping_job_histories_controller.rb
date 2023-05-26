class ScrapingJobHistoriesController < ApplicationController
  before_action :set_scraping_job_history, only: %i[ show edit update destroy ]

  # GET /scraping_job_histories or /scraping_job_histories.json
  def index
    @scraping_job_histories = ScrapingJobHistory.all
  end

  # GET /scraping_job_histories/1 or /scraping_job_histories/1.json
  def show
  end

  # GET /scraping_job_histories/new
  def new
    @scraping_job_history = ScrapingJobHistory.new
  end

  # GET /scraping_job_histories/1/edit
  def edit
  end

  # POST /scraping_job_histories or /scraping_job_histories.json
  def create
    @scraping_job_history = ScrapingJobHistory.new(scraping_job_history_params)

    respond_to do |format|
      if @scraping_job_history.save
        format.html { redirect_to scraping_job_history_url(@scraping_job_history), notice: "Scraping job history was successfully created." }
        format.json { render :show, status: :created, location: @scraping_job_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scraping_job_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraping_job_histories/1 or /scraping_job_histories/1.json
  def update
    respond_to do |format|
      if @scraping_job_history.update(scraping_job_history_params)
        format.html { redirect_to scraping_job_history_url(@scraping_job_history), notice: "Scraping job history was successfully updated." }
        format.json { render :show, status: :ok, location: @scraping_job_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scraping_job_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraping_job_histories/1 or /scraping_job_histories/1.json
  def destroy
    @scraping_job_history.destroy

    respond_to do |format|
      format.html { redirect_to scraping_job_histories_url, notice: "Scraping job history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_job_history
      @scraping_job_history = ScrapingJobHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scraping_job_history_params
      params.require(:scraping_job_history).permit(:started_at, :ended_at, :successful, :content, :scraping_job_id)
    end
end
