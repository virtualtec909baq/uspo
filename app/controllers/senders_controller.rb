class SendersController < InheritedResources::Base

  private

    def sender_params
      params.require(:sender).permit(:city_id_destination, :city_id_departure, :arrive_time, :img, :object_description, :user_id, :packege_type_id, :note)
    end
end

