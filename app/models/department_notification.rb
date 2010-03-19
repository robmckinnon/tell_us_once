class DepartmentNotification < ActiveRecord::Base
  belongs_to :submitter
  belongs_to :change_notification, :polymorphic => true
  validates_presence_of :submitter_id
  
  def process
    
  end
end
