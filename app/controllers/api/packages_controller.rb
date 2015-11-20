class Api::PackagesController < ApplicationController

	# GET /packages
	# GET /packages.json
	def index
		@packages = Package.where(courier_id: params[:courier_id],remittent_id: params[:remittent_id] ).order(created_at: :desc).order(created_at: :desc)
		render json: { packages: @packages, status: "ok" },status: 200
	end

	# POST /packages
	def create
		@package = []
		package = Package.new(packege_params)
		if package.save
			@package << package
			render json: { package: @package, status: "ok" },status: 200
		else 
			render json: { package: @package.errors, status: "not_found" },status: 422
		end
	end
end