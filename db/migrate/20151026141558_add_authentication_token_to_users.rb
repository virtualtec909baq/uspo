class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
    add_column :users, :tokens, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :authentication_token
  end
end
