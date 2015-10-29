class Courier < ActiveRecord::Base
	has_many :remittents, :through => :packeges
  	has_many :packeges 
  	belongs_to :user
  	validates :time_arriv, presence: true
  	validates :departure_time, presence: true
end
