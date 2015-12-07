class AddImagesToSettins < ActiveRecord::Migration
  def change
    add_column :settins, :image, :string
    add_column :settins, :has_image, :boolean
  end
end
