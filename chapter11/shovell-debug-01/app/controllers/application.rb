# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '4ed6b43c1e9e4ec6bde3a8ce0f558f4a'
  
  before_filter :fetch_logged_in_user

  protected

  def fetch_logged_in_user
    return unless session[:user_id]
    @current_user = User.find_by_id(session[:user_id])
  end
  
  def logged_in?
    ! @current_user.nil?
  end
  helper_method :logged_in?

  def login_required
    return true if logged_in?
    session[:return_to] = request.request_uri
    redirect_to new_session_path and return false
  end
end
