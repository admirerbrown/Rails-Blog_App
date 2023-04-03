class UsersController < ApplicationController
  def show
    # ! @user = User.find(params[:id])
  end

  def user_posts
    # ! @user = User.find(params[:id])
    # ! @posts = Post.where(user_id: @user.id)
  end

  def post_details
    # ! @user = User.find(params[:id])
    # ! @post = @user.posts.find(params[:post_id])
  end
end
