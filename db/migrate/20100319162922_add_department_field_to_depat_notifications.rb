class AddDepartmentFieldToDepatNotifications < ActiveRecord::Migration
  def self.up
    add_column :department_notifications, :department, :string
  end

  def self.down
    remove_column :department_notifications, :department
  end
end
