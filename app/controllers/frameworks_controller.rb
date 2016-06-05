class FrameworksController < ApplicationController
  before_action :set_framework, only: [:show, :update, :destroy]

  # GET /frameworks
  # GET /frameworks.json
  def index
    @frameworks = Framework.all

    render json: @frameworks
  end

  # GET /frameworks/1
  # GET /frameworks/1.json
  def show
    render json: @framework
  end

  # POST /frameworks
  # POST /frameworks.json
  def create
    @framework = Framework.new(framework_params)

    if @framework.save
      render json: @framework, status: :created, location: @framework
    else
      render json: @framework.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /frameworks/1
  # PATCH/PUT /frameworks/1.json
  def update
    @framework = Framework.find(params[:id])

    if @framework.update(framework_params)
      head :no_content
    else
      render json: @framework.errors, status: :unprocessable_entity
    end
  end

  # DELETE /frameworks/1
  # DELETE /frameworks/1.json
  def destroy
    @framework.destroy

    head :no_content
  end

  private

    def set_framework
      @framework = Framework.find(params[:id])
    end

    def framework_params
      params[:framework]
    end
end
