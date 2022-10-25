class ApplicationController < ActionController::Base
  def hello
    render html: " hai"
  end
  # protect_from_forgery with: :exception

  # before_action :require_user

  # helper_method :current_user, :logged_in?
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   !!current_user
  # end

  # def require_user
  #   if logged_in?
  #     current_user
  #   else
  #     flash[:alert] = "You must be logged in to perform this action"
  #     redirect_to login_path
  #   end
  # end
end
