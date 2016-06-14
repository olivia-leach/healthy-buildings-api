class PointsController < ApplicationController
  before_action :set_point, only: [:show, :update, :destroy]
  before_action :authenticate

  # GET /points
  # GET /points.json
  def index
    @points = Point.all

    render json: @points
  end

  # GET /points/1
  # GET /points/1.json
  def show
    render json: @point
  end

  # POST /points
  # POST /points.json
  def create
    @point = Point.new(point_params)

    if @point.save
      render json: @point, status: :created, location: @point
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /points/1
  # PATCH/PUT /points/1.json
  def update
    @point = Point.find(params[:id])

    if @point.update(point_params)
      head :no_content
    else
      render json: @point.errors, status: :unprocessable_entity
    end
  end

  # DELETE /points/1
  # DELETE /points/1.json
  def destroy
    @point.destroy

    head :no_content
  end

  private

    def set_point
      @point = Point.find(params[:id])
    end

    def point_params
      params[:point]
    end
end
