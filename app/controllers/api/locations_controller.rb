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
    respond_to do |format|
      format.json do
        render :json => @locations.to_json(:include => :cities)
      end
    end
  end
end
