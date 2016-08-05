class SubsController < ApplicationController

  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      # fail
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

  def update
    @sub = Sub.find_by(sub_params)
    if @sub.update
      redirect_to sub_url(@sub)
    else
      redirect_to edit_sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

end
