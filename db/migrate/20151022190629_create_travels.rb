class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer :city_id_destination
      t.integer :city_id_departure
      t.time :arrive_time
      t.time :departure_time
      t.string :img_ticke
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
