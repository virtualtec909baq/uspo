class Api::PackagesController < ApplicationController
	before_action :set_package, only: [:show, :edit, :update, :destroy]
	
	def index
	  if params[:profile]
	  	@packages = []
	  	@couriers = Courier.where(user_id: params[:current_user])
		@couriers.each do |c|
			p = Package.where(courier_id: c.id, acceted_request: true).last
			@packages << p
      	end
      	@remittents = Remttents.where(user_id: params[:current_user])
		@remittents.each do |r|
			p = Package.where(remittent_ir: c.id, acceted_request: true).last
			@packages << p
      	end
      elsif params[:history]
      	@packages = Package.where("(courier_id = ? OR remittent_id = ? AND status = ?)", params[:current_user], params[:current_user], true)
      else
		@packages = Package.all
	  end
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