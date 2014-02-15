class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
  	if session[:user_id]
  		User.find_by(id: session[:user_id]) rescue nil
  	end
  end

  def log_user_in(user)
    session[:user_id] = user.id
  end

  def login_required
  	unless current_user
      flash[:error] = "You must be logged in to do that!"
      session[:redirect_params] = params
      redirect_to login_path
  	end
  end
end
