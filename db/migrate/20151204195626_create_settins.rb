class CreateSettins < ActiveRecord::Migration
  def change
    create_table :settins do |t|
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
