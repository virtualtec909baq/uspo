class AddFieldsToCouriers < ActiveRecord::Migration
  def change
  	add_column :couriers, :zip_code, :integer
    add_column :remittents, :zip_code, :integer
    add_column :packages, :name, :string
    add_column :packages, :city, :string
    add_column :packages, :zipe_code, :integer
    add_column :packages, :place, :string
    add_column :packages, :date, :datetime
    add_column :packages, :description, :string
    add_column :packages, :phone, :string
  end
end
