class LocationsController < InheritedResources::Base

  private

    def location_params
      params.require(:location).permit(:description, :cd)
    end
end

