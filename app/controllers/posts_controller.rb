class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      user_id: current_user.id,
    )
    if @post.save
      redirect_to posts_path
    else
      @errors = @post.errors.full_messages
      redirect_to posts_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end
end