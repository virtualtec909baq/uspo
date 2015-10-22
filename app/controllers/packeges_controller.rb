class PackegesController < InheritedResources::Base

  private

    def packege_params
      params.require(:packege).permit(:travel_id, :sender_id, :status)
    end
end

