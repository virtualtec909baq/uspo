class CreateRemittents < ActiveRecord::Migration
  def change
    create_table :remittents do |t|
      t.integer :user_id
      t.text :description
      t.string :packege_img
      t.string :location_arrived
      t.string :location_departure
      t.integer :packege_type_id
      t.text :description_location
      t.boolean :status

      t.timestamps null: false
    end
  end
end
