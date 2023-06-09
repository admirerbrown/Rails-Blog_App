class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = Post.where(author_id: @user.id)
    @recent_posts = @user.recent_posts
  end
end
