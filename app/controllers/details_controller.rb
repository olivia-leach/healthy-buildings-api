class DetailsController < ApplicationController
  before_action :set_detail, only: [:show, :update, :destroy]
  before_action :authenticate

  # GET /details
  # GET /details.json
  def index
    @details = Detail.all

    render json: @details
  end

  # GET /details/1
  # GET /details/1.json
  def show
    render json: @detail
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)

    if @detail.save
      render json: @detail, status: :created, location: @detail
    else
      render json: @detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /details/1
  # PATCH/PUT /details/1.json
  def update
    @detail = Detail.find(params[:id])

    if @detail.update(detail_params)
      head :no_content
    else
      render json: @detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail.destroy

    head :no_content
  end

  private

    def set_detail
      @detail = Detail.find(params[:id])
    end

    def detail_params
      params[:detail]
    end
end
