class Sender < ActiveRecord::Base
	belongs_to :packege_type
	has_one :packege
end
