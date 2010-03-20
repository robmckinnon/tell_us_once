class DeathNotificationsController < ResourceController::Base
  
  def new
    @death_notification = DeathNotification.new
    @latest_death_year = Date.today.year
    @earliest_death_year = Date.today.year - 1
    
    @earliest_birth_year = Date.today.year - 130
    @latest_birth_year = Date.today.year
  end

end
