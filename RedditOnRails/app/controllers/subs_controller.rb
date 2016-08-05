class SubsController < ApplicationController

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      redirect_to subs_url
    end
  end

  def destroy
  end

  def edit
    @sub = Sub.find_by(sub_params)
    render :edit
  end

  def show
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :descrption, :moderator_id)
  end

end
