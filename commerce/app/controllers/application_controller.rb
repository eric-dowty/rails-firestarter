class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :load_cart

  before_action :load_cart

  def load_cart
    @cart ||= Cart.new(session[:cart])
    @cart.sanitize
  end

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
