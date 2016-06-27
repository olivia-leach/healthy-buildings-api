class CertificationsController < ApplicationController
  before_action :set_certification, only: [:show, :update, :destroy]
  before_action :authenticate

  # GET /certifications
  # GET /certifications.json
  def index
    @certifications = Certification.all

    render json: @certifications
  end

  # GET /certifications/1
  # GET /certifications/1.json
  def show
    render json: @certification
  end

  # POST /certifications
  # POST /certifications.json
  def create
    @certification = Certification.new(certification_params)

    if @certification.save
      render json: @certification, status: :created, location: @certification
    else
      render json: @certification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /certifications/1
  # PATCH/PUT /certifications/1.json
  def update
    @certification = Certification.find(params[:id])

    if @certification.update(certification_params)
      head :no_content
    else
      render json: @certification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /certifications/1
  # DELETE /certifications/1.json
  def destroy
    @certification.destroy

    head :no_content
  end

  private

    def set_certification
      @certification = Certification.find(params[:id])
    end

    def certification_params
      params[:certification]
    end
end
