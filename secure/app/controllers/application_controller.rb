class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= user_from_session || Guest.new
  end

  def logged_in?
    session[:user_id]
  end

  private

  def user_from_session
    User.find(session[:user_id]) if session[:user_id]
  end

end