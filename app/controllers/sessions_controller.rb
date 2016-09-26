class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user.nil?
      flash.now[:errors] ||= []
      flash.now << "this user/pass combo aint doin it"
    else
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to cats_url
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
    end
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
