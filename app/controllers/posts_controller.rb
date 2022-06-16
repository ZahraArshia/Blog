class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = User.find(params[:user_id])
    @post = @author.posts.new(post_params)

    if @post.save
      redirect_to user_path(id: @post.author_id), notice: 'post crated succesfully'
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
