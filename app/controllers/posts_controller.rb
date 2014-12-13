class PostsController < ApplicationController
  def index
    # default page all posts
    @posts = Post.all
  end

  def show
    # show ind post
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # saves post to db
    @post = Post.new(user_params)

    if @post.save
      redirect_to posts_path, :notice => "Your post was saved."
    else
      render "new"
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(user_params)
      redirect_to posts_path, :notice => "Your post has been updated"
    else
      render "edit"
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  end

  private

  def user_params
    params.require(:post).permit(:title, :content)
  end


end
