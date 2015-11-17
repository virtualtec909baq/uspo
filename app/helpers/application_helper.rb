module ApplicationHelper
	def get_user_photo(user)
		if user.pic.blank?
          	photo =  ActionController::Base.helpers.asset_path("placeholder.png")
        else
          	photo = user.pic.file.url
        end
        return photo
	end
end
