class CreateCouriers < ActiveRecord::Migration
  def change
    create_table :couriers do |t|
      t.integer :user_id
      t.text :trip_description
      t.string :img_ticket
      t.string :location_arrived
      t.string :location_departure
      t.time :time_arriv
      t.time :departure_time

      t.timestamps null: false
    end
  end
end
