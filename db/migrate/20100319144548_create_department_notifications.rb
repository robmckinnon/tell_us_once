class CreateDepartmentNotifications < ActiveRecord::Migration
  def self.up
    create_table :department_notifications do |t|
      t.integer :submitter_id
      t.string  :change_notification_type
      t.integer :change_notification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :department_notifications
  end
end
