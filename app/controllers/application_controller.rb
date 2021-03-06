class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!@current_user
  end

  def authentication_required
    if !logged_in?
      redirect_to root_path
      flash[:notice] = "Please log in first."
    end
  end
end
