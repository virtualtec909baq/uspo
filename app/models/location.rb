class Location < ActiveRecord::Base
	has_many :cities
	self.per_page = 12
end
