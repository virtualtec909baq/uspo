class Api::PackagesController < ApplicationController
	before_action :set_package, only: [:show, :edit, :update, :destroy]
	
	def index
		@packages = Package.all
		render json: { packages: @packages, status: "ok" },status: 200
	end

	# GET /remittents/1
	def show
		package = []
		package << @package
		render json: { package: package, status: "ok" },status: 200
	end

	# POST /packages
	def create
		package = []
		@package = Package.new(packege_params)
		if @package.save
			package << @package
			render json: { package: package, status: "ok" },status: 200
		else 
			render json: { package: @package.errors, status: "not_found" },status: 422
		end
	end

	# PATCH/PUT /couriers/1
	def update
		package = []
		if @package.update(packege_params)
			package << @package
			unless @package.remittent_id.blank?
				@packages = Package.where("(remittent_id = ?) AND id != ?", @package.remittent_id, @package.id) 
				@packages.update_all(acceted_request: false)
			end
			render json: { package: @package, status: "ok" },status: 200
		else 
			render json: { message: @package.errors, status: "not_found" },status: 422
		end
	end

	private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      if @package = Package.find(params[:id])
      else 
        record_not_found(error)
      end
    end

    def record_not_found(error)
      render :json => {:error => error.message}, :status => :not_found
    end 

    # Only allow a trusted parameter "white list" through.
    def packege_params
      params.require(:package).permit!
    end
end