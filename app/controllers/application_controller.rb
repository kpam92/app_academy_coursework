class ApplicationController < ActionController::Base
  helper_method :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def current_user
    fail
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end
