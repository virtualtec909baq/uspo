class PackegeTypesController < InheritedResources::Base

  private

    def packege_type_params
      params.require(:packege_type).permit(:description)
    end
end

