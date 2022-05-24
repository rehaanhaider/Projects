module SessionsHelper
    def log_in(user)
      session[:user_id] = user.id
      session[:expires_at] = Time.zone.now + 1.minutes
    end
  
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
  
    def logged_in?
      !current_user.nil?
    end
  
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  
    def current_user?(user)
      user == current_user
    end
  
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
  
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end

    def session_expires
      @time_left = (session[:expires_at].to_time.to_i - DateTime.now.to_time.to_i)
      unless @time_left > 0
        log_out
        flash[:error] = 'Session Over!! Login again.'
        redirect_to :controller => 'sessions', :action => 'create'
      end
    end
    
    def update_session_time
      session[:expires_at] = session[:expires_at].to_time + 10.seconds
    end

  end