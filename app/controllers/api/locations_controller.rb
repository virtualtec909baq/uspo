class Api::LocationsController < ApplicationController
	# GET /locations
	# GET /locations.json
	def index
    if params[:q]
      @search = Location.ransack(params[:q])
      @locations = @search.result.includes(:cities).order(description: :asc)
    else
      @locations = Location.all.includes(:cities).order(description: :asc)
    end
    respond_to do |format|
      format.json do
        render :json => @locations.to_json(:include => :cities)
      end
    end
  end
end
