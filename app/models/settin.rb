class Settin < ActiveRecord::Base
	# img_uploader
  	mount_uploader :image, ImageUploader
end
