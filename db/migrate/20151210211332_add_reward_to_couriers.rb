class AddRewardToCouriers < ActiveRecord::Migration
  def change
    add_column :couriers, :reward, :float
    add_column :remittents, :reward, :float
  end
end
