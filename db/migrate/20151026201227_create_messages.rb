class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id_reciver
      t.integer :user_id_sender
      t.boolean :important
      t.boolean :read
      t.boolean :trash
      t.text :messange

      t.timestamps null: false
    end
  end
end
