class Packege < ActiveRecord::Base
	belongs_to :courier
	belongs_to :remittent
end
