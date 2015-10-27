class CreatePackeges < ActiveRecord::Migration
  def change
    create_table :packeges do |t|
      t.integer :courier_id
      t.integer :remittent_id
      t.boolean :status

      t.timestamps null: false
    end
  end
end
