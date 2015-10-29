class ChangeDateFormatInMyCouriers < ActiveRecord::Migration
  def change
  	remove_column :couriers, :time_arriv
  	remove_column :couriers, :departure_time
  	add_column :couriers, :departure_time, :datetime
  	add_column :couriers, :time_arriv, :datetime
  end
end
