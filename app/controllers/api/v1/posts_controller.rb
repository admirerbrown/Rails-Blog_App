class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @posts = User.find(params[:user_id]).posts
    render json: @posts
  end
end
