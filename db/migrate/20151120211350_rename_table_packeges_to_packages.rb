class RenameTablePackegesToPackages < ActiveRecord::Migration
  def change
  	rename_table :packeges, :packages
  end
end
