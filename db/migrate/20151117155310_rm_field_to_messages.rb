class RmFieldToMessages < ActiveRecord::Migration
  def change
  	remove_column :messages, :user_id_reciver, :integer
  	remove_column :messages, :messange, :text
  	add_column :messages, :user_id_receiver, :integer
  	add_column :messages, :message, :text
  end
end
