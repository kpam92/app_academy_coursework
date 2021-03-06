class SubsController < ApplicationController
  before_action :is_moderator?

  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all
    # fail
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
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update

    @sub = Sub.find_by(id: params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      redirect_to edit_sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    fail
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def is_moderator?
    if @sub
      @sub = Sub.find_by(id: params[:id])
      @sub.moderator_id == current_user.id
    end
  end

end
