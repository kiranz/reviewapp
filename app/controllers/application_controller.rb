class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_logged_in

  private

  def token
    session[:token]
  end

  def current_user
    session[:user]
  end
  helper_method :current_user

  def session_logged_in
    session[:token] && session[:user]
  end
  helper_method :session_logged_in

  def verify_logged_in
    unless session_logged_in
      redirect_to '/login', notice: 'Please log in'
    end
  end

end
