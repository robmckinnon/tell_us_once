module ChangeNotificationMethods
  module ClassMethods
    
  end
  
  module InstanceMethods
    def sent?
      !department_notifications.empty?
    end
    private
    def create_department_notifications
      change_type = self.class.to_s.tableize.sub('_notifications','').to_sym
      DepartmentNotification.access_details[change_type].keys.each do |department|
        notification = DepartmentNotification.create!(:submitter => submitter, :change_notification => self, :department => department)
        Delayed::Job.enqueue(notification)
      end
    end    
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.belongs_to :submitter
    receiver.has_many :department_notifications, :as => :change_notification
    # receiver.validates_presence_of :submitter_id
    receiver.after_create :create_department_notifications
    receiver.accepts_nested_attributes_for :submitter
    
  end
end