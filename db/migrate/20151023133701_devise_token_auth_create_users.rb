class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
 def change
    add_column :users, :provider, :string, :default => "email"
    add_column :users, :uid,  :string, :null => false, :default => ""
    add_column :users, :unconfirmed_email, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :tokens, :text
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :confirm_success_url, :string
    add_index :users, [:uid, :provider],     :unique => true
 end
end
 