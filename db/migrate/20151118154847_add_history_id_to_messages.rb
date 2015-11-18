class AddHistoryIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :history_id, :integer
  end
end
