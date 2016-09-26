class UsersController < ApplicationController
  def new
    @user = User.find_by(id: params[:id])
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    # fail
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to user_url(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      # redirect_to
      render :new
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to :new
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
