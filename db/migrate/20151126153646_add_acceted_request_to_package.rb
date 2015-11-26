class AddAccetedRequestToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :acceted_request, :boolean
    add_column :packages, :user_id, :integer
  end
end
