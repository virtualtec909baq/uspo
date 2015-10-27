class Api::LocationsController < ApplicationController
	# GET /locations
	# GET /locations.json
	def index
    if params[:q]
      @search = Location.ransack(params[:q])
      @locations = @search.result.order(description: :asc)
    else
      @locations = Location.all.order(description: :asc)
    end
    respond_to do |format|
      format.json do
        render :json =>  {locations: @locations}
      end
    end
  end
end

