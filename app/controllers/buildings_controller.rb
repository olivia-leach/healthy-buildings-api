class BuildingsController < OpenReadController
  before_action :set_building, only: [:show, :update, :destroy]
  before_action :authenticate, except: [:index, :show]

  # GET /buildings
  # GET /buildings.json
  def index
    # @buildings = Building.all
    @buildings = current_user.buildings

    render json: @buildings
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    render json: @building
  end

  # POST /buildings
  # POST /buildings.json
  def create
    # @building = Building.new(building_params)
    @building = current_user.buildings.new(building_params.merge(user_id: params[:user_id]))

    if @building.save
      render json: @building, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    @building = Building.find(params[:id])

    if @building.update(building_params)
      head :no_content
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    building = Building.find(params[:id])
    building.destroy

    head :no_content
  end

  private

    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:BID, :name, :address, :city, :state, :zip, :lat, :long, :sq_ft, :year_const, :num_floors, :notes)
    end
end
