class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :update, :destroy]
  before_action :authenticate

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all

    render json: @sensors
  end

  # GET /sensors/1
  # GET /sensors/1.json
  def show
    render json: @sensor
  end

  # POST /sensors
  # POST /sensors.json
  def create
    @sensor = Sensor.new(sensor_params)

    if @sensor.save
      render json: @sensor, status: :created, location: @sensor
    else
      render json: @sensor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    @sensor = Sensor.find(params[:id])

    if @sensor.update(sensor_params)
      head :no_content
    else
      render json: @sensor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sensors/1
  # DELETE /sensors/1.json
  def destroy
    @sensor.destroy

    head :no_content
  end

  private

    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

    def sensor_params
      params[:sensor]
    end
end
