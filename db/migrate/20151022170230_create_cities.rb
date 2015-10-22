class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :location_id
      t.string :cd
      t.string :description

      t.timestamps null: false
    end
  end
end
