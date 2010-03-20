class AddProcessedAtToDepartmentNotification < ActiveRecord::Migration
  def self.up
    add_column :department_notifications, :processed_at, :datetime
  end

  def self.down
    remove_column :department_notifications, :processed_at
  end
end
