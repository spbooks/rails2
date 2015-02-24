class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # :secret => '4ed6b43c1e9e4ec6bde3a8ce0f558f4a'
  
  before_filter :fetch_logged_in_user

  protected

  def fetch_logged_in_user
    return unless session[:user_id]
    @current_user = User.find_by_id(session[:user_id])
  end
end