class DataPointsController < ApplicationController
  before_action :set_data_point, only: [:show, :update, :destroy]

  # GET /data_points
  # GET /data_points.json
  def index
    @data_points = DataPoint.all

    render json: @data_points
  end

  # GET /data_points/1
  # GET /data_points/1.json
  def show
    render json: @data_point
  end

  # POST /data_points
  # POST /data_points.json
  def create
    @data_point = DataPoint.new(data_point_params)

    if @data_point.save
      render json: @data_point, status: :created, location: @data_point
    else
      render json: @data_point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_points/1
  # PATCH/PUT /data_points/1.json
  def update
    @data_point = DataPoint.find(params[:id])

    if @data_point.update(data_point_params)
      head :no_content
    else
      render json: @data_point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_points/1
  # DELETE /data_points/1.json
  def destroy
    @data_point.destroy

    head :no_content
  end

  private

    def set_data_point
      @data_point = DataPoint.find(params[:id])
    end

    def data_point_params
      params[:data_point]
    end
end
