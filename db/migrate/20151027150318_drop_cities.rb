class DropCities < ActiveRecord::Migration
  def change
  	drop_table :cities
  end
end
