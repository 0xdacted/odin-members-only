class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] "Your post was successful"
      redirect_to index
    else
      flash[:error] "Your post was unsuccessful"
      render 'new'
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end