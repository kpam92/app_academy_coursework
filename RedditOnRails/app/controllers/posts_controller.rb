class PostsController < ApplicationController

  def new
    @post = Post.new
    # fail
    render :new
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(title: params[:post][:title], content: params[:post][:content], author_id: params[:post][:author_id], sub_id: params[:sub_id], url: "#")
      redirect_to post_url(@post)
    else
      redirect_to edit_sub_post_url
    end
  end

  def destroy
  end

  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content], author_id: params[:post][:author_id], sub_id: params[:sub_id], url: "#")
    if @post.save
      # redirect_to subs_url
      redirect_to post_url(@post)
    else
      redirect_to new_sub_post_url
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    unless is_author?
      flash.now[:error] = @post.errors.full_messages
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    # params.require(:post).permit(:title,:content,:sub_id, :author_id)
    params.require(:post).permit(:title,:content,:sub_id,:author_id)
    params[:url] = "#"
    # params[:author_id] = current_user.id
    params
  end

  def is_author?
    @post = Post.find_by(id: params[:id])
    @post.author_id == current_user.id
  end
end
