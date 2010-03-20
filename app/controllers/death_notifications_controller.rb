class DeathNotificationsController < ResourceController::Base
  
  def new
    @death_notification = DeathNotification.new
    @latest_death_year = Date.today.year
    @earliest_death_year = Date.today.year - 1
    
    @earliest_birth_year = Date.today.year - 130
    @latest_birth_year = Date.today.year
  end
  
  def create
    @death_notification = DeathNotification.new(params[:death_notification])
    if @death_notification.save
      redirect_to(death_notification_path(@death_notification))
    else
      render(:action => :new)
    end
  end

end
