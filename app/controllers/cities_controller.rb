class CitiesController < InheritedResources::Base

  private

    def city_params
      params.require(:city).permit(:location_id, :cd, :description)
    end
end

