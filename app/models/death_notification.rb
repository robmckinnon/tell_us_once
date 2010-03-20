class DeathNotification < ActiveRecord::Base
  include ChangeNotificationMethods

  validates_presence_of :deceased_first_name, :deceased_family_name, :date_of_death, :relationship_to_deceased
end
