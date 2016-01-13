class AddFieldsToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :name, :string
    add_column :packages, :city, :string
    add_column :packages, :zipe_code, :integer
    add_column :packages, :place, :string
    add_column :packages, :date, :datetime
    add_column :packages, :description, :string
    add_column :packages, :phone, :string
    add_column :couriers, :reward, :float
    add_column :remittents, :reward, :float
  end
end
