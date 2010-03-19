class DeathNotification < ActiveRecord::Base
  
  belongs_to :submitter
  accepts_nested_attributes_for :submitter

  validates_presence_of :deceased_first_name, :deceased_family_name, :date_of_death, :relationship_to_deceased

end
