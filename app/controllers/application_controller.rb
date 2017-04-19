class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
# u = User.first
# u.admin = true
# u
  end

  def admin?
    current_user.admin
  end
  helper_method :admin?
end
