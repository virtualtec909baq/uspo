class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :rol, :string
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :occupation, :string
    add_column :users, :pic, :string
    add_column :users, :bio, :string
    add_column :users, :city, :string
    add_column :users, :tw, :string
    add_column :users, :int, :string
    add_column :users, :fb, :string
  end
end
