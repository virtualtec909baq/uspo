class Api::LocationsController < ApplicationController
	# GET /locations
	# GET /locations.json
	def index
    if params[:q]
      @search = City.ransack(params[:q])
      @locations = @search.result.order(description: :asc)
    else
      @locations = City.all.order(description: :asc)
    end
    render json: { locations: @locations, status: "ok" },status: 200
  end
end
