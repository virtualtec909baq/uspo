class Remittent < ActiveRecord::Base
	has_many :couriers, :through => :packeges
  	has_many :packeges 
  	belongs_to :user
  	# img_uploader
  	mount_uploader :packege_img, ImageUploader
end
