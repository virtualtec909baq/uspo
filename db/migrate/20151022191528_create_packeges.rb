class CreatePackeges < ActiveRecord::Migration
  def change
    create_table :packeges do |t|
      t.integer :travel_id
      t.integer :sender_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
