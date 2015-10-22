class Sender < ActiveRecord::Base
	belong_to :packege_type
	has_one :packege
end
