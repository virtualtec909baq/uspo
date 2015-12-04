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
    @locations_list = []
    @locations.each do |location|
      a = ["id", "#{location.id}", "city", "#{location.description}", "location", "#{location.location.description}"]
      h = Hash[*a]
      @locations_list << h
    end
    render json: { locations: @locations_list, status: "ok" },status: 200
  end
end
