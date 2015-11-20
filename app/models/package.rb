class Package < ActiveRecord::Base
	belongs_to :courier
	belongs_to :remittent
end
