class Package < ActiveRecord::Base
	scope :all_except, ->(package) { where.not(id: package) }
	belongs_to :courier
	belongs_to :remittent
	belongs_to :user
	after_create :init

	def init
		self.status  ||= false
  	end
end
