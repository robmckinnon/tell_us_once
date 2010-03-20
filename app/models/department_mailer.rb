class DepartmentMailer < ActionMailer::Base
  
  def notification(department_notification)
    @recipients   = department_notification.endpoint 
    @from         = 'notifier@tellusonce.gov.uk'
    @subject      = "New #{department_notification.change_notification_type} :: " + department_notification.submitter.full_name
    @sent_on      = Time.now
    @body[:change_notification] = department_notification.change_notification
    @body[:submitter] = department_notification.submitter
    @headers      = {}
  end

end
