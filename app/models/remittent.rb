class Remittent < ActiveRecord::Base
	has_many :couriers, :through => :packeges
  	has_many :packeges 
  	belongs_to :user
end
