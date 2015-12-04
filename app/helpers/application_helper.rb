module ApplicationHelper
	def get_user_photo(user)
		if user.pic.blank?
          	photo =  ActionController::Base.helpers.asset_path("placeholder.png")
        else
          	photo = user.pic.url
        end
        return photo
	end
	def get_package_photo(remittent)
		if remittent.packege_img.blank?
          	photo =  ActionController::Base.helpers.asset_path("placeholder_remittent.png")
        else
          	photo = remittent.packege_img.url
        end
        return photo
	end
  def get_courier_photo(courier)
    if courier.img_ticket.blank?
            photo =  ActionController::Base.helpers.asset_path("placeholder-boarding.png")
        else
            photo = courier.img_ticket.url
        end
        return photo
  end
end
