class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end