class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
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
    @user = current_user
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to posts_path
  end
end