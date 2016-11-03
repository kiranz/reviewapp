class SessionsController < ApplicationController
  skip_before_action :verify_logged_in, :only => [:new, :create]

  def new

  end

  def create
    @session = User.get_token(user_credentials)

    if @session
      session[:token] = @session
      session[:user] =  user_email
      redirect_to '/hotels', notice: 'Logged in!'
    else
      redirect_to '/login', notice: 'Incorrect credentials'
    end
  end

  def destroy
    session[:token] = nil
    session[:user] = nil
    # reset_session
    redirect_to '/login', notice: 'Logged out'
  end

  private

  def user_credentials
    {:user => params['session']['email'], :password => params['session']['password']}
  end

  def user_email
    params['session']['email']
  end

end
