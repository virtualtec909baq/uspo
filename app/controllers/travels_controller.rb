class TravelsController < InheritedResources::Base

  private

    def travel_params
      params.require(:travel).permit(:city_id_destination, :city_id_departure, :arrive_time, :departure_time, :img_ticke, :description, :user_id)
    end
end

