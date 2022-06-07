class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_logged_in?

  def current_user
    return nil if session[:member_type] != 'User'
    User.find_by(id: session[:member_id])
  end

  def user_logged_in?
    !current_user.nil?  
  end

  def user_authorized?
    redirect_to new_session_path unless user_logged_in?
  end
end
