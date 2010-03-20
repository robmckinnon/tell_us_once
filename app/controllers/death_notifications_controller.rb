class DeathNotificationsController < ResourceController::Base
  
  before_filter :authenticate, :except => ['new','create']
  before_filter :respond_not_found_if_notification_sent_or_bad_authenticity_token, :except => ['new','create']

  def new
    @death_notification = DeathNotification.new
    @latest_death_year = Date.today.year
    @earliest_death_year = Date.today.year - 1
    
    @earliest_birth_year = Date.today.year - 130
    @latest_birth_year = Date.today.year
  end

  def create
    # raise params.inspect
    if flash[:notification_just_sent]
      flash[:error] = 'Choose another notification to send.'
      flash.delete(:notification_just_sent)
      redirect_to root_path
    else   
      notification_params = params['death_notification']
      if notification_params
        notification_params['authenticity_token'] = params[:authenticity_token]
        flash['authenticity_token'] = params[:authenticity_token]
        send_notification = (notification_params['sent'] == '1')
        notification_params.delete('sent')
      end
  
      build_object
      load_object
      before :create
      if send_notification && @death_notification.save
        after :create
        flash[:notification_just_sent] = true
        render :template => 'death_notifications/show'
      elsif !send_notification && @death_notification.valid?
        after :create
        render :template => 'death_notifications/show'
      else
        after :create_fails
        set_flash :create_fails
        response_for :create_fails
      end
    end
  end

  private

    def authenticity_token
      params[:authenticity_token] || flash['authenticity_token']
    end

    def respond_not_found_if_notification_sent_or_bad_authenticity_token
      if (notification_id = params[:id])
        if !DeathNotification.exists?(notification_id)
          render_not_found
        else
          @death_notification = DeathNotification.find(notification_id)
  
          if @death_notification.nil?
            render_not_found
  
          elsif @death_notification.sent?
            # raise flash[:notification_just_sent].class.name
            show_sent_notification = (flash[:notification_just_sent] && params[:action] == 'show')
            flash.keep(:notification_just_sent)
            render_not_found('Not found or expired page.') unless show_sent_notification
  
          else
            bad_authenticity_token = !@notification.authenticate(authenticity_token)
            render_not_found if bad_authenticity_token
          end
        end
      end
    end
end
