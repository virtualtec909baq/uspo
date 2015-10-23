class LocationsController < ApplicationController
	# before_action :authenticate_user!
	before_action :set_location, only: [:show, :edit, :update, :destroy]

	# GET /locations
	# GET /locations.json
	def index
    @search = Location.ransack(params[:q])
    @locations = @search.result.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

	def new
		@location = Location.new()
	end

	# GET /location/1
	# GET /location/1.json
	def show
	end

	# GET /location/1/edit
	def edit
	end

	# POST /locations
	# POST /locations.json
	def create
		@location = Location.new(location_params)
		respond_to do |format|
      if @location.save
        format.html { redirect_to locations_path, notice: 'Ubicacion creada' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
	end

	# PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to locations_path, notice: 'Ubicacion fue modificado' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

	# DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      flash[:notice] = 'Ubicacion eliminada'
      format.html { redirect_to locations_path}
      format.json { head :no_content }
    end
  end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_location
      @location = Location.find(params[:id])
    end

		def location_params
			params.require(:location).permit(:description, :cd)
		end
end

