class Location < ActiveRecord::Base
	has_many :cities, :dependent => :destroy
    accepts_nested_attributes_for :cities, allow_destroy: true
	self.per_page = 12
	validates :description, presence: true
	validates :cd, presence: true
end
