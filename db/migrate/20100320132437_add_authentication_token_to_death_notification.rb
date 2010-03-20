class AddAuthenticationTokenToDeathNotification < ActiveRecord::Migration
  def self.up
    add_column :death_notifications, :authenticity_token, :string
  end

  def self.down
    remove_column :death_notifications, :authenticity_token
  end
end
