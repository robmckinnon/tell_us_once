class DeathNotificationsController < ResourceController::Base
  
  def new
    @death_notification = DeathNotification.new
  end

end
