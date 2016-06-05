class BaselinesController < OpenReadController
  before_action :set_baseline, only: [:show, :update, :destroy]
  before_action :authenticate, except: [:index, :show]

  # GET /baselines
  # GET /baselines.json
  def index
    @baselines = Baseline.all

    render json: @baselines
  end

  # GET /baselines/1
  # GET /baselines/1.json
  def show
    render json: @baseline
  end

  # POST /baselines
  # POST /baselines.json
  def create
    @baseline = Baseline.new(baseline_params)

    if @baseline.save
      render json: @baseline, status: :created, location: @baseline
    else
      render json: @baseline.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /baselines/1
  # PATCH/PUT /baselines/1.json
  def update
    @baseline = Baseline.find(params[:id])

    if @baseline.update(baseline_params)
      head :no_content
    else
      render json: @baseline.errors, status: :unprocessable_entity
    end
  end

  # DELETE /baselines/1
  # DELETE /baselines/1.json
  def destroy
    @baseline.destroy

    head :no_content
  end

  private

    def set_baseline
      @baseline = Baseline.find(params[:id])
    end

    def baseline_params
      params[:baseline]
    end
end
