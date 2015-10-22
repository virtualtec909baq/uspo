class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :description
      t.string :cd

      t.timestamps null: false
    end
  end
end
