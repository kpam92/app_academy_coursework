class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @users.errors.full_messages
    end
  end

  def show
    @user = current_user
    if @user.id = params[:id]
      redirect_to cats_url
    else
      redirect_to cats_url
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:password, :user_name)
  end

end
