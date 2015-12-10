class AddZipCodeToCouriers < ActiveRecord::Migration
  def change
    add_column :couriers, :zip_code, :integer
    add_column :remittents, :zip_code, :integer
  end
end
