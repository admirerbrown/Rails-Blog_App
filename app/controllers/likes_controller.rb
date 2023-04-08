class LikesController < ApplicationController
  def new
    @like = Like.new
    @like.user = current_user
    @like.post = Post.find(params[:post_id])
    if @like.save
      flash[:notice] = 'Like added successfully!'
      @like.update_likes_counter
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      flash[:alert] = "Couldn't add a like!"
      puts @like.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end
end
