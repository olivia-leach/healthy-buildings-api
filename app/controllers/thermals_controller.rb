class ThermalsController < ApplicationController
  before_action :set_thermal, only: [:show, :update, :destroy]

  # GET /thermals
  # GET /thermals.json
  def index
    @thermals = Thermal.all

    render json: @thermals
  end

  # GET /thermals/1
  # GET /thermals/1.json
  def show
    render json: @thermal
  end

  # POST /thermals
  # POST /thermals.json
  def create
    @thermal = Thermal.new(thermal_params)

    if @thermal.save
      render json: @thermal, status: :created, location: @thermal
    else
      render json: @thermal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thermals/1
  # PATCH/PUT /thermals/1.json
  def update
    @thermal = Thermal.find(params[:id])

    if @thermal.update(thermal_params)
      head :no_content
    else
      render json: @thermal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thermals/1
  # DELETE /thermals/1.json
  def destroy
    @thermal.destroy

    head :no_content
  end

  private

    def set_thermal
      @thermal = Thermal.find(params[:id])
    end

    def thermal_params
      params[:thermal]
    end
end
