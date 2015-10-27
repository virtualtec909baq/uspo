class DropTables < ActiveRecord::Migration
  def change
  	drop_table :senders
  	drop_table :travels
  	drop_table :packeges
  	
  end
end
