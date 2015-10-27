class Courier < ActiveRecord::Base
	has_many :couriers, :through => :packeges
  	has_many :packeges 
end
