class DepartmentNotification < ActiveRecord::Base
  belongs_to :submitter
  belongs_to :change_notification, :polymorphic => true
  validates_presence_of :submitter_id, :department
  
  def self.access_details
    DepartmentNotificationDetails
  end
  
  def endpoint
    self.class.access_details[change_notification_type.sub('Notification','').downcase.to_sym][department]
  end
  
  def perform
    send_message
  end
  
  def send_message
    if endpoint =~ EmailAddress
      DepartmentMailer.deliver_notification(self)
    else
      _http_post(endpoint)
    end
  end
  
  protected
  def _http_post(url)
    
  end
end
