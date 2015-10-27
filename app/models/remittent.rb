class Remittent < ActiveRecord::Base
	has_many :remittents, :through => :packeges
  	has_many :packeges 
end
