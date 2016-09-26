class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_parameters(params[:user][:username], params[:user][:password])

    unless @user.nil?
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      # @user.session_token = session[:session_token]
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["User doesnt exist?"]
      redirect_to new_session_url
    end

  end

  def destroy
    @user = User.find_by(session_token: session[:session_token])
    session[:session_token] = nil
    @user.reset_session_token!
    redirect_to new_session_url
  end
end
