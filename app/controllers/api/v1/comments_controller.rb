class Api::V1::CommentsController < ApplicationController
  #   before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @comments = Comment.where(user_id: params[:user_id])
    render json: @comments
  end
end