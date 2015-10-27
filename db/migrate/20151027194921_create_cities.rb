class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :description
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
