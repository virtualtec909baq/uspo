class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.text :description
      t.integer :ranking_value
      t.integer :user_sender_id

      t.timestamps null: false
    end
  end
end
