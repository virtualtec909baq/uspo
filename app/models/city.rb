class City < ActiveRecord::Base
	belongs_to :location
	validates :description, presence: true
end
