class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.integer :city_id_destination
      t.integer :city_id_departure
      t.time :arrive_time
      t.string :img
      t.string :object_description
      t.integer :user_id
      t.integer :packege_type_id
      t.string :note
      t.boolean :status
      t.timestamps null: false
    end
  end
end
