class DepartmentNotification < ActiveRecord::Base
  belongs_to :submitter
  belongs_to :change_notification, :polymorphic => true
  validates_presence_of :submitter_id, :department
  alias_method :old_to_xml, :to_xml
  
  def self.access_details
    DepartmentNotificationDetails
  end
  
  def endpoint
    self.class.access_details[change_notification_type.sub('Notification','').downcase.to_sym][department]
  end
  
  def perform
    send_message
    update_attribute(:processed_at, Time.now)
  end
  
  def send_message
    if endpoint =~ EmailAddress
      DepartmentMailer.deliver_notification(self)
    else
      _http_post(endpoint, self.to_xml)
    end
  end
  
  # def to_xml(options={})
    # xml = Builder::XmlMarkup.new(:indent => 2)
    # xml.instruct! unless options[:skip_instruct]
    # xml.notification do
    #   xml.text!!(:submitter, 'foo')
    # end
    
  # end
  def to_xml(options={}, &block)
    old_to_xml({:include => {:change_notification => {:root => 'death_notification'}, :submitter => {}}, :root => 'notification'}.merge(options), &block)
  end
  
  
  protected
  def _http_post(url, xml_notification)
    return if RAILS_ENV == 'test'
    res = Net::HTTP.post(URI.parse(url), xml_notification)
    logger.debug { "Posted message to to #{url}\n#{xml_notification}\n Response = res" }
    res
  end
end
