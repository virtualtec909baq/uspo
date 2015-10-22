class CreatePackegeTypes < ActiveRecord::Migration
  def change
    create_table :packege_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
